module UserSessionsHelper

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
    self.current_user = user
  end

  def user_signed_in?
    !current_user.nil?
  end

  def user_sign_out
    current_user.update_attribute(:remember_token, User.digest(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.digest(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default )
    session.delete(:return_to)
  end

  # saves requested URL in sesson, but only for a GET request
  # hence can't store_location if submitting form when not logged in (POST)
  # or deleteing remember token before form submission (DELETE)
  def store_location
    session[:return_to] = request.url if request.get?
  end

end
