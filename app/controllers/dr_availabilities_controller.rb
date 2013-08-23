class DrAvailabilitiesController < ApplicationController

include DrAvailabilitiesHelper

  before_action :check_doctor_login

  respond_to :json

  def index
    @dr_availability = DrAvailability.find(session[:doctor_id])
    respond_with @dr_availability
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
    redirect_to dr_availability_path
  end

  def edit
  end

  private

  def dr_availability_params
    params.require(:dr_availability).permit(:clinic_open, :clinic_close, :avg_appt_time, :day)
  end

end

