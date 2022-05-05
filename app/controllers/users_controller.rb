class UsersController < ApplicationController

  # GET /users
  def index
    @users = User.order(:id).page(params[:page])
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    # application.html.erbを使用しない
    # render :layout => nil
  end
  
end
