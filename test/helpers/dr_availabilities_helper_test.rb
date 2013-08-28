require 'test_helper'

class DrAvailabilitiesHelperTest < ActionView::TestCase
  
  include ApplicationHelper

  setup do
    @appt = patient_appointments(:one)
  end

  test "should check if time is booked" do
    time_booked?(@appt.start_time, @appt.date, @appt.dr_availability_id)
    assert true
  end

  test "should return false if time is free" do
    time_booked?(Time.now, Time.now, @appt.dr_availability_id)
  end


end
