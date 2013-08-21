class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_login_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render text: "record updated."
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :password, :password_confirmation, :city, :province, :postal_code, :address, :type)
  end 
end
