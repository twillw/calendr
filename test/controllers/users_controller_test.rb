require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  

  setup do
    @valid_user = { name: "valid_name",
                            email: "fake@example.com",
                            phone_number: "5555555555",
                            password: "some_valid_password",
                            password_confirmation: "some_valid_password",
                            address: "100 Fake Ave",
                            postal_code: "k0a1l0",
                            city: "Some_city",
                            province: "Ontario"
                            type: "Doctor"
    }
  end 


  test "should get new" do
    get :new
    assert :success    
  end

  test "should redirect to login page if user not logged in" do
    get :show
    assert_redirected_to login_users_path
  end


  test "should create new user" do
    assert_difference "User.count" do
      post :create, user: @valid_user
    end
  end

  test "should get edit user" do
    get :edit, id: users(:test1)
    assert :success
  end

  test "should update user with new params" do
    patch :update, id: users(:test1), user: @valid_user

    assert_equal assigns[:user].name, "valid_name"
  end

  private

  def login_as(user)
    if user.type == "Doctor"
      session[:doctor_id] = user.id
    else
      session[:user_id] = user.id
    end
  end

end
