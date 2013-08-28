require 'test_helper'

class PatientAppointmentTest < ActiveSupport::TestCase

  test "should not be able to double book an appointment" do
    @appt = patient_appointments(:one)
    new_appt = PatientAppointment.new(start_time: @appt.start_time, date: @appt.date)

    assert new_appt.invalid?
  end
end
