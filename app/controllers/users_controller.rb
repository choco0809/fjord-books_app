# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def follows
    user = User.find(params[:user_id])
    @users = user.following_user.page(params[:page]).per(3).reverse_order
  end
  
  def followers
    user = User.find(params[:user_id])
    @users = user.follower_user.page(params[:page]).per(3).reverse_order
  end
end
