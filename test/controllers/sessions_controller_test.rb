require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "should get login page" do
    get :new
    assert :success
  end

  test "patient should be able to login with valid credentials" do
    post :create, user: {email: "test@example.com", password_digest: "password"}
    assert_equal session[:patient_id], users(:test1).id
  end

  test "doctor should be able to login with valid credentials" do
    post :create, user: {email: "test2@example.com", password_digest: "password"}
    assert_equal session[:doctor_id], users(:test2).id
  end

  test "should not set session with invalid credentials" do
    post :create, user: { email: "foo", password_digest: "bar" }
    assert flash[:error]
  end

  test "should empty the current session" do
    login_as(users(:test1))
    get :destroy
    assert_equal session[:user_id], nil
  end


  private 

  def login_as(user)
    session[:user_id] = user.id
  end
end
