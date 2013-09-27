class UserSessionsController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create]

  # get /login
  def new
    @user_session = UserSession.new
  end

  # post /user_session
  def create
    @user_session = UserSession.new(user_session_params)

    if @user_session.save
      redirect_to root_url
    else
      render action: :new
    end
  end

  # delete /logout
  def destroy
    current_user_session.destroy
    redirect_to login_url
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password)
  end
end
