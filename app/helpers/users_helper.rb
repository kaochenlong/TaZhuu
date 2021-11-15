module UsersHelper
  def user_signed_in?
    session[:whatever123].present?
  end
end
