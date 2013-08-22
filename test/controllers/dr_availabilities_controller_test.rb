require 'test_helper'

class DrAvailabilitiesControllerTest < ActionController::TestCase
  
  test "should get form for when doctor logged in new dr_availablilities" do
    login_as(users(:test2))
    get :new
    assert :success
  end

  test "should be redirected from dr_availabilities if logged in as patient" do
    login_as(users(:test1))
    get :new
    assert_redirected_to login_users_path
  end

  test "should be redirected from dr_availabilities if not logged in" do
    get :new
    assert_redirected_to login_users_path
  end

  test "should create new DrAvailability" do
    assert_difference "DrAvailability.count" do
      schedule = dr_availabilities(:one)
      login_as(users(:test2))
      DrAvailability.create!(clinic_open: schedule.clinic_open, clinic_close: schedule.clinic_close, avg_appt_time: schedule.avg_appt_time, doctor_id: session[:doctor_id])
    end
  end

  test "should get edit" do
    get :edit
    assert :success
  end

end
