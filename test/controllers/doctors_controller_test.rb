require 'test_helper'

class DoctorsControllerTest < ActionController::TestCase

  setup do
    @valid_dr = {  name: "valid_name",
                          email: "fake@example.com",
                          phone_number: "5555555555",
                          password: "some_valid_password",
                          password_confirmation: "some_valid_password",
                          address: "100 Fake Ave",
                          postal_code: "k0a1l0",
                          city: "Some_city",
                          province: "Ontario"
    }
  end 


  test "should get new" do
    get :new
    assert :success    
  end

  test "should create new dr" do
    assert_difference "Doctor.count" do
      post :create, doctor: @valid_dr
    end
  end

  test "should get edit doctor" do
    get :edit, id: doctors(:one)
    assert :success
  end

  test "should update user with new params" do
    patch :update, id: doctors(:one), doctor: @valid_dr

    assert_equal assigns[:doctor].name, "valid_name"
  end
end
