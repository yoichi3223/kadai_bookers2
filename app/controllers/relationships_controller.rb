class RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:follow_id])
    redirect_to request.referer
    #   flash[:success] = 'ユーザーをフォローしました'
    #   redirect_to request.referer
    # else
    #   flash.now[:alert] = 'ユーザーのフォローに失敗しました'
    #   redirect_to request.referer
    # end
  end

  def destroy
      following = current_user.unfollow(params[:id])
    # if following.destroy
    #   flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to request.referer
  	  end
  #   else
  #     flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
  #     redirect_to request.referer
  #   end
  # end
end
