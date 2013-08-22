class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email]) 

    if @user && @user.authenticate(params[:user][:password])
      if @user.type == 'Doctor'
        session[:doctor_id] = @user.id
        redirect_to new_dr_availability_path
      elsif @user.type == 'Patient'
        session[:patient_id] = @user.id
        render text: "patient logged in"
      end
    else
      flash[:error] = "Invalid credentials, please try again."
      redirect_to login_users_path
    end
  end

  def destroy
    reset_session
    redirect_to login_users_path
  end


end
