class Users::FollowersController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @users = user.followers.order(:id).page(params[:page]).per(3)
  end
end
