class UsersController < ApplicationController

  skip_before_filter :require_login, only: [:new, :create]

  # get /signup
  def new
    @user = User.new
  end

  # post /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_url
    else
      render action: :new
    end
  end

  # get /
  def home
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
