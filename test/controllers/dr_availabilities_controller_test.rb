require 'test_helper'

class DrAvailabilitiesControllerTest < ActionController::TestCase
  
  test "should get form for when doctor logged in new dr_availablilities" do
    login_as(users(:test2))
    get :index
    assert :success
  end

  test "should be redirected from dr_availabilities if logged in as patient" do
    login_as(users(:test1))
    get :index
    assert_redirected_to login_users_path
  end

  test "should be redirected from dr_availabilities if not logged in" do
    get :index
    assert_redirected_to login_users_path
  end

  test "should get form" do
    visit('/dr_availabilities')
    assert :success
  end

  test "should get index when logging in as doctor" do
    login_as(users(:test2))
    get :index
    assert :success
  end


  private

  def login_as(user)
    session[:user_id] = user.id
  end
end
