class PatientAppointmentsController < ApplicationController  

  include PatientAppointmentsHelper

  before_action :check_current_doctor
  before_action :check_user_login

  def index
    #NEED TO FIGURE THIS OUT ONE
    if @current_user.type=="Patient"
      redirect_to user_path(@current_user)
    else
      @patient_appointments = PatientAppointment.all
    end
    @patient_appointments = PatientAppointment.where(user_id: @current_user.id)
  end

  def show
    @patient_appointment = PatientAppointment.find(params[:id])
    @doctor = get_desired_doctor(@patient_appointment)
  end

  def new
    @patient_appointment = PatientAppointment.new(start_time: params[:time], date: params[:date], user_id: @current_user, dr_availability_id: @dr_availability, appointment_booked: true)
  end

  def create
    @patient_appointment = AppointmentBooker.new(params, patient_appointment_params, @current_user, @current_doctor).do_the_booking
    redirect_to patient_appointment_path(@patient_appointment)
  end

  def new_preferences
    @new_preferences = PatientAppointment.new 
  end

  def create_preferences
    i = 0
    while i < 3
      @new_preferences = PatientAppointment.new(start_time: params[:patient_appointments][i][:start_time], dr_availability_id: get_desired_dr_availability(params[:patient_appointments][i][:day], @current_doctor))
      @new_preferences.user_id = @current_user.id
      @new_preferences.appointment_booked = false
      @new_preferences.save unless @new_preferences.start_time == nil
      i += 1
    end
    redirect_to patient_appointments_path
  end

  private

  def patient_appointment_params
    params.require(:patient_appointment).permit(:start_time, :date)
  end

  def preference_time_params
    params.require(:preference_times).permit(:start_time, :date, :appointment_booked)
  end
end
