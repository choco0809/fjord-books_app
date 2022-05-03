# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # devise_controllerを使用する際、
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # 追加したカラムのデータをparamsに付与する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :adress, :introduction])
  end
end
