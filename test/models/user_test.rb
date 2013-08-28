require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  setup do
    @invalid_email = { name: "valid_name",
                      email: "foo",
                      phone_number: "5555555555",
                      password: "some_valid_password",
                      password_confirmation: "some_valid_password",
                      address: "100 Fake Ave", 
                      postal_code: "k0a1l0", 
                      city: "Some_city", 
                      province: "Ontario"
    }
  end

  test "user fields can not be blank" do
    user = User.new(password: "password", password_confirmation: "password")
    
    assert user.invalid?
  end

  test "user needs to give valid email" do
    invalid_user = User.new(@invalid_email)

    assert invalid_user.invalid?
  end

  test "email needs to be unique for new user" do
    assert_no_difference "User.count" do
      user_attributes = { name: "george", 
                          email: "test@example.com", 
                          password: "password",
                          password_confirmation: "password", 
                          phone_number: 5555555555, 
                          address: "100 Fake Ave", 
                          postal_code: "k0a1l0", 
                          city: "Some_city", 
                          province: "Ontario" }
      new_user = User.new(user_attributes)
      new_user.save
    end
  end

  test "phone_number must be 7 digits" do
    user = User.new(name: "george", 
                              email: "test@example.com", 
                              password: "password",
                              password_confirmation: "password", 
                              phone_number: 5555555, 
                              address: "100 Fake Ave", 
                              postal_code: "k0a1l0", 
                              city: "Some_city", 
                              province: "Ontario"  )
    assert user.invalid?
  end
end
