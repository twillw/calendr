class PreferencesController < ApplicationController

  include PatientAppointmentsHelper

  before_action :check_current_doctor, except: [:create_preferences]
  before_action :check_user_login

  def new
    @new_preferences = PatientAppointment.new 
  end

  def create
    create_new_preferences(params)
    redirect_to patient_appointments_path
  end

end
