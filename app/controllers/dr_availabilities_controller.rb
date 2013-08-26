class DrAvailabilitiesController < ApplicationController

include DrAvailabilitiesHelper

  before_action :check_user_login

  respond_to :html, :json

  def index
    @dr_availabilities = DrAvailability.where(doctor_id: session[:doctor_id])
    respond_with @dr_availabilities
  end

  def show
    @current_date = params[:clicked_date]
    puts "[show] @current_date = #{@current_date}"
    if @current_date
      @current_day = get_day_of_week_from_date(@current_date)
      @appointment_times = split_schedule_into_appts(@current_day)
      puts "[show] @current_day = #{@current_day}"
      puts "[show] @appointment_times.inspect = #{@appointment_times.inspect}"
      # respond_with @appointment_times
      render 'show', layout: false
    end
    # split_schedule_into_appts(params[:clicked_date])
  end


  def new
    if @current_user.type == "Doctor"
      @dr_availability = DrAvailability.new
      @days_of_the_week = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
    # else 
    #   redirect_to login_users_path, notice: "You must me logged in as a Doctor to create a new Dr Schedule"
    end
  end

  def create
    create_availabilities_for_each_day(params)
    redirect_to dr_availabilities_path
  end

  def edit
  end

  private

  def dr_availability_params
    params.require(:dr_availability).permit(:clinic_open, :clinic_close, :avg_appt_time, :day)
  end

end

