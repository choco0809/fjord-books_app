class Users::FollowsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @users = user.followings.page(params[:page]).per(3).reverse_order
  end
end
