class UsersController < ApplicationController
  layout 'users.html.erb'
  # GET /users
  def index
    @users = User.order(:id).page(params[:page])
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end
  
end
