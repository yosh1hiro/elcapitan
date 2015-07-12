module SessionsHelper
  def login(user)
    auto_login_token = User.generate_auto_login_token
    cookies.permanent[:auto_login_token] = auto_login_token
    user.update_attribute(:auto_login_token, User.digest(auto_login_token))
    self.current_user = user
  end

  def loged_in?
    !current_user.nil?
  end

  def current_user
    auto_login_token  = User.digest(cookies[:auto_login_token])
    @current_user ||= User.find_by(auto_login_token: auto_login_token)
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user?(user)
    user == current_user
  end
end
