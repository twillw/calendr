module PatientAppointmentsHelper

  def get_desired_doctor(appointment)
    dr_availability = DrAvailability.find(appointment.dr_availability_id)
    doctor = User.find(dr_availability.doctor_id)
  end

  def get_desired_dr_availability_id(day, doctor)
    if day
      dr_availability = DrAvailability.find_by(day: day, doctor_id: doctor.id)
      dr_availability.id
    end
  end

  def create_new_preferences(params)
    i = 0
    @current_doctor = session[:current_doctor]
    while i < 3
      @day = params[:patient_appointments][i][:day].downcase!
      @new_preferences = PatientAppointment.new(start_time: params[:patient_appointments][i][:start_time], dr_availability_id: (get_desired_dr_availability_id(@day, @current_doctor)))
      @new_preferences.user_id = @current_user.id
      @new_preferences.appointment_booked = false
      @new_preferences.save unless @new_preferences.start_time == nil
      i += 1
    end
  end
end
