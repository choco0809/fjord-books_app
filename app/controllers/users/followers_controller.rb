class Users::FollowersController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @users = user.followers.page(params[:page]).per(3).reverse_order
  end
end
