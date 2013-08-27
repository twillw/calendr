module ApplicationHelper

  def time_booked?(time, date, dr_availability)
    appt = PatientAppointment.where(start_time: time, date: date, dr_availability: dr_availability)
    if appt
      true
    else
      false
    end
  end
end
