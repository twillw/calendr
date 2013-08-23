class DrAvailabilitiesController < ApplicationController

include DrAvailabilitiesHelper

  before_action :check_doctor_login

  def index
    unless @current_doctor
      redirect_to login_users_path, notice: "You must me logged in as a Doctor to create a new Dr Schedule"
    end
  end

  def new
    if @current_doctor
      @dr_availability = DrAvailability.new
      @days_of_the_week = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
    # else 
    #   redirect_to login_users_path, notice: "You must me logged in as a Doctor to create a new Dr Schedule"
    end
  end

  def create
    create_availabilities_for_each_day(params)

  end

  private

  def dr_availability_params
    params.require(:dr_availability).permit(:clinic_open, :clinic_close, :avg_appt_time, :day)
  end

end

