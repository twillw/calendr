class DoctorsController < ApplicationController


  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      render text: "coming soon"
    else
      render :new
    end
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(doctor_params)
      render text: "record updated."
    else
      render :edit
    end
  end


  private

  def doctor_params
    params.require(:doctor).permit(:name, :email, :phone_number, :password, :password_confirmation, :city, :province, :postal_code, :address)
  end 
end
