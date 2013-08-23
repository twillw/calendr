class PatientAppointmentsController < ApplicationController  

  def index
    @patient_appointments = PatientAppointment.all
  end

  def new
    @patient_appointment = PatientAppointment.new
  end

end
