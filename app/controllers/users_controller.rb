class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render text: "coming soon"
    else
      render :new
    end
  end




  private

  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :password, :password_confirmation)
  end 
end
