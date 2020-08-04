class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :profile_image, destroy: false
  # has_many :relationships, class_name: 'Relationship', foreign_key: "user_id"
  # has_many :followings, through: :relationships, source: :follow
  # has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  # has_many :followers, through: :reverse_of_relationships, source: :user
    has_many :follower, class_name: "Relationship", foreign_key: "user_id", dependent: :destroy
    has_many :followed, class_name: "Relationship", foreign_key: "follow_id", dependent: :destroy
    has_many :following_user, through: :follower, source: :user
    has_many :follower_user, through: :followed, source: :follow
def follow(other_user)
    # unless self == other_user
      self.follower.find_or_create_by(follow_id: other_user)
    # end
  end

  def unfollow(other_user)
    relationship = self.follower.find_by(follow_id: other_user)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.follower.find_by(follow_id: other_user.id)
  end

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name,presence: true,length: { in: 2..20 }
  validates :introduction,length: { maximum: 50 }
end
