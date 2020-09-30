class UsersController < ApplicationController
  def index
    redirect_to sessions_new_path
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render 'Success' 
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password_digest)
  end
end
