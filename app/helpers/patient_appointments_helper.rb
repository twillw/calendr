module PatientAppointmentsHelper

  def get_desired_doctor(appointment)
    dr_availability = DrAvailability.find(appointment.dr_availability_id)
    doctor = User.find(dr_availability.doctor_id)
  end

  def get_desired_dr_availability(day, doctor)
    dr_availability = DrAvailability.find_by(day: day, doctor_id: doctor.id)
  end
end
