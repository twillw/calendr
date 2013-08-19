require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  

  setup do
    @valid_user = { name: "valid_name",
                          email: "fake@example.com",
                          phone_number: "5555555555",
                          password: "some_valid_password",
                          password_confirmation: "some_valid_password"
    }
  end 


  test "should get new" do
    get :new
    assert :success    
  end

  test "should create new user" do
    assert_difference "User.count" do
      post :create, user: @valid_user
    end
  end

  test "default is_admin should be false when new user created" do
    post :create, user: @valid_user
    assert_equal false, assigns[:user].is_admin
  end

end
