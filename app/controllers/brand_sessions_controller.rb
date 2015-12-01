class BrandSessionsController < ApplicationController
  def new
  end

  def create
    @brand = Brand.find_by(username: brand_session_params[:username])
    if @brand && @brand.authenticate(brand_session_params[:password])
      sign_in @brand
      redirect_to @brand
    else
      redirect_to root_path
    end
  end

  def destroy
    brand_sign_out
    redirect_to root_path
  end

  private

    def brand_session_params
      params.require(:brand_session).permit(:username, :password)
    end
end
