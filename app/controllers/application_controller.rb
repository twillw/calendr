class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #setting @current_user variable to be used in UsersController based on which session was created

  def check_user_login
     if session[:patient_id]
       @current_user = User.find(session[:patient_id])
     elsif session[:doctor_id]
       @current_user = User.find(session[:doctor_id])
     end
  end
end
