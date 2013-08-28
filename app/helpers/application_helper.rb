module ApplicationHelper

  def time_booked?(time, date, dr_availability)
    appt = PatientAppointment.where(start_time: time)
    if appt
      appt.each do |appt|
        if appt.dr_availability_id == dr_availability && appt.date == date && appt.appointment_booked == true
          return true
        else
          return false
        end
      end
    end
  end
end
