require 'test_helper'

class DoctorTest < ActiveSupport::TestCase
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

  test "doctor fields can not be blank" do
    doctor = Doctor.new(password: "password", password_confirmation: "password")
    
    assert doctor.invalid?
  end

  test "doctor needs to give valid email" do
    invalid_doctor = Doctor.new(@invalid_email)

    assert invalid_doctor.invalid?
  end

  test "email needs to be unique for new doctor" do
    assert_no_difference "Doctor.count" do
      doctor_attributes = { name: "george", 
                                    email: "test@example.com", 
                                    password: "password",
                                    password_confirmation: "password", 
                                    phone_number: 5555555555, 
                                    address: "100 Fake Ave", 
                                    postal_code: "k0a1l0", 
                                    city: "Some_city", 
                                    province: "Ontario" }
      new_doctor = Doctor.new(doctor_attributes)
      new_doctor.save
    end
  end

  test "phone_number must be 7 digits" do
    doctor = Doctor.new(name: "george", 
                              email: "test@example.com", 
                              password: "password",
                              password_confirmation: "password", 
                              phone_number: 5555555, 
                              address: "100 Fake Ave", 
                              postal_code: "k0a1l0", 
                              city: "Some_city", 
                              province: "Ontario"  )
    assert doctor.invalid?
  end
end
