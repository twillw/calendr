require 'test_helper'

class PatientAppointmentsControllerTest < ActionController::TestCase

  test "should get index of patient appointments" do
    login_as(users(:test1))
    get :index
    assert_response :success
  end

  test "should be able to make new appointment" do
    get :new
    assert_response :success
  end

  test "should be able to cancel appointment" do
  login_as(users(:test1))
    assert_difference "PatientAppointment.count", -1 do
      delete :destroy, id: patient_appointments(:one)
    end
  end
 
end
