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
    while i < 3
      @date = params[:preferences][i][:day]
      @date = @date.to_date if @date
      @new_preferences = Preference.new(start_time: params[:preferences][i][:start_time], date: @date, patient_appointment_id: params[:preferences][i][:patient_appointment_id])
      @new_preferences.save unless @new_preferences.start_time == nil
      i += 1
    end
  end
end
