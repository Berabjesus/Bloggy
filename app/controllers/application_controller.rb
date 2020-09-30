class ApplicationController < ActionController::Base
  def current_user
    User.find_by(id: session[:bloggy_user_id_session])  
  end
end
