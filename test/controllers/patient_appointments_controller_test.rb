require 'test_helper'

class PatientAppointmentsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should get index of patient appointments" do
    get :index
    assert_response :success
  end

  test "should be able to make new appointment" do
    get :new
    assert_response :success
  end

  

  
end
