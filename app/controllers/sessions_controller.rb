class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.password_digest == (params[:password_digest])
      session.delete(:guest_session) if !session[:guest_session].nil?
      session[:bloggy_user_id_session] = @user.id
      redirect_to blogs_path
    else
      redirect_to sessions_new_path, alert: "You are not signed up!"
   end
  end

  def guest
    session[:guest_session] = 0
    redirect_to blogs_path
  end

  def destroy
    session.delete(:bloggy_user_id_session)
    redirect_to sessions_new_path, notice: 'Your not Logged out.'
  end
end
