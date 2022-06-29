# frozen_string_literal: true

module ApplicationHelper
  def user_name_or_email(user)
    user = User.find(user[:user_id])
    user.name == '' ? user.email : user.name
  end
end
