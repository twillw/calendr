ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
#Getting capybara ready for use
# require "capybara/rails"
# require "minitest/rails/capybara"

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  private

  def login_as(user)
    if user.type == "Doctor"
      session[:doctor_id] = user.id
    elsif user.type == "Patient"
      session[:patient_id] = user.id
   end
  end

  def integration_login_as(user)
    visit login_users_path
    fill_in(:user_email, with: user.email)
    fill_in(:user_password, with: "password")
    click_button("Login")
  end
end
