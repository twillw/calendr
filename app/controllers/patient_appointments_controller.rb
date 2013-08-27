class PatientAppointmentsController < ApplicationController  

  include PatientAppointmentsHelper

  before_action :check_current_user, :check_current_doctor

  def index
    @patient_appointments = PatientAppointment.all
  end

  def show
    @patient_appointment = PatientAppointment.find(params[:id])
    @doctor = get_desired_doctor(@patient_appointment)
  end

  def new
    @patient_appointment = PatientAppointment.new
  end

  def create
    @dr_availability = get_current_doctor_availability(params)
    @patient_appointment = PatientAppointment.new(start_time: params[:time], date: params[:date], user_id: @current_user, dr_availability_id: @dr_availability, appointment_booked: true)
    if @patient_appointment.save
      redirect_to patient_appointment_path(@patient_appointment)
  end

end
