require 'test_helper'

class DrAvailabilitiesControllerTest < ActionController::TestCase
  
  test "should get form for new dr_availablilities" do
    get :new
    assert :success
  end
end
