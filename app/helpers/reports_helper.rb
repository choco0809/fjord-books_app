module ReportsHelper
  def user_name_or_email(user_id)
    @user = User.find(user_id)
    user_name = @user.name == '' ? @user.email : @user.name
  end
end
