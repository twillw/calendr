module PatientAppointmentsHelper

  def get_current_doctor_availability(params)
    dr_availability = DrAvailability.find_by(doctor_id: @current_doctor, day: params[:date])
  end

  def get_desired_doctor(appointment)
    dr_availability = DrAvailability.find(appointment.dr_availability_id)
    doctor = User.find(dr_availability.doctor_id)
  end
end
