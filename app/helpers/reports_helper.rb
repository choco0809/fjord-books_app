module ReportsHelper
  def user_name_or_email(report)
    @user = User.find(report[:user_id])
    @user.name == '' ? @user.email : @user.name
  end
end
