class UserSessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: user_session_params[:username])
    if @user && @user.authenticate(user_session_params[:password])
      sign_in @user
      redirect_to @user
    else
      redirect_to root_path
    end
  end

  def destroy
    user_sign_out
    redirect_to root_path
  end

  private

    def user_session_params
      params.require(:user_session).permit(:username, :password)
    end
end
