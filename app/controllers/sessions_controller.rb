class SessionsController < ApplicationController
  before_action :check_user_login, except: [:create]
  
  def new
      @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email]) 

    if @user && login_valid?(@user)
      if @user.type == 'Doctor'
        session[:doctor_id] = @user.id
        redirect_to user_path(@user)
      elsif @user.type == 'Patient'
        session[:patient_id] = @user.id
        redirect_to user_path(@user)
      end
    else
      flash[:error] = "Invalid login, please try again."
      redirect_to login_users_path
    end
  end

  def destroy
    reset_session
    redirect_to login_users_path
  end

  private

  def login_valid?(user)
    if Rails.env.test?
      if params[:user][:password_digest] == user.password_digest
        return true
      end
    elsif user.authenticate(params[:user][:password])
      return true
    end
  end
end
