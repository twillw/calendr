class PatientAppointmentsController < ApplicationController  

  include PatientAppointmentsHelper

  before_action :check_current_doctor
  before_action :check_user_login

  def index
    @patient_appointments = PatientAppointment.all
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

  private

  def patient_appointment_params
    params.require(:patient_appointment).permit(:start_time, :date)
  end
end
