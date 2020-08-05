class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @new_book = Book.new
  end

  def index
    @user = User.find(current_user.id)
    @users = User.all
    @new_book = Book.new
  end
    def follows
    @user = User.find(params[:id])
    end
    def followed
    @user = User.find(params[:id])
    end
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      @book = Book.new
      render :edit
    end
  end
  private
  def user_params
    params.require(:user).permit(:title, :profile_image,:name,:introduction)
  end
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
    redirect_to user_path(current_user)
    end
  end
end
