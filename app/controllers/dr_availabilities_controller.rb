class DrAvailabilitiesController < ApplicationController

include DrAvailabilitiesHelper

  before_action :check_user_login

  def new
    @dr_availability = DrAvailability.new
    @days_of_the_week = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
  end

  def create
    create_availabilities_for_each_day(params)

  end

  private

  def dr_availability_params
    params.require(:dr_availability).permit(:clinic_open, :clinic_close, :avg_appt_time, :day)
  end

end
