class Users::FollowsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @users = user.followings.order(:id).page(params[:page]).per(3)
  end
end
