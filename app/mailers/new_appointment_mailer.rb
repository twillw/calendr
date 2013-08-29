class NewAppointmentMailer < ActionMailer::Base
  default from: "bookings@calendr.com"
  include ApplicationHelper

  def new_appointment_email(patient_appointment)
    @user=User.find(patient_appointment.user_id)
    @appointment = patient_appointment
    @doctor=find_respective_doctor(patient_appointment)
    mail(to: @user.email, subject: 'Confirmation of Your Appointment')
  end

  def change_appt_mail(user, appointment, replaced_appointment) 
    @user = user
    @appointment = appointment
    @date = @appointment.date
    @start_time = @appointment.start_time
    @replaced_appointment = replaced_appointment
    mail(to: @user.email, subject: "Would you like to reschedule your Doctor's appointment?") 
  end

end
