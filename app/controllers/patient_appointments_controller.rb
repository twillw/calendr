class PatientAppointmentsController < ApplicationController  

  include PatientAppointmentsHelper, ApplicationHelper

  before_action :check_current_doctor
  before_action :check_user_login

  def index
    # #NEED TO FIGURE THIS OUT ONE
    # if @current_user.type=="Patient"
    #   redirect_to user_path(@current_user)
    # else
    #   @patient_appointments = PatientAppointment.all
    # end
    if @current_user.type=="Patient"
      @patient_appointments = PatientAppointment.where(user_id: @current_user.id)
    elsif @current_user.type=="Doctor"
      all_patient_appointments = PatientAppointment.all
      @patient_appointments=[]
      all_patient_appointments.each do |appointment|
        if find_respective_doctor(appointment) == @current_user
          @patient_appointments.push(appointment)
        end
      end
    end
  end

  def show
    @patient_appointment = PatientAppointment.find(params[:id])
    @doctor = get_desired_doctor(@patient_appointment)
    session[:current_doctor] = @doctor
  end

  def new
    @patient_appointment = PatientAppointment.new(start_time: params[:time], date: params[:date], user_id: @current_user, dr_availability_id: @dr_availability, appointment_booked: true)
  end

  def create
    @patient_appointment = AppointmentBooker.new(params, patient_appointment_params, @current_user, @current_doctor).do_the_booking
    redirect_to patient_appointment_path(@patient_appointment)
  end



  def destroy
    @cancelled_appointment = PatientAppointment.delete(params[:id])
    redirect_to patient_appointments_path
    @possible_replacements = Preference.where(date: @cancelled_appointment.date) 
  end

  private

  def patient_appointment_params
    params.require(:patient_appointment).permit(:start_time, :date)
  end

end
