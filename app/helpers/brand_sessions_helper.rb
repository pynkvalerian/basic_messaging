module BrandSessionsHelper

  def sign_in(brand)
    remember_token = Brand.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    brand.update_attribute(:remember_token, Brand.digest(remember_token))
    self.current_user = brand
  end

  def brand_signed_in?
    !current_brand.nil?
  end

  def brand_sign_out
    current_brand.update_attribute(:remember_token, Brand.digest(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_brand = nil
  end

  def current_brand=(brand)
    @current_brand = brand
  end

  def current_brand
    remember_token = Brand.digest(cookies[:remember_token])
    @current_brand ||= Brand.find_by(remember_token: remember_token)
  end

  def current_brand?(brand)
    brand == current_brand
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
