class User < ActiveRecord::Base

  after_initialize :set_user_type
  has_secure_password

  validates_presence_of :name, :email, :phone_number
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  private

  def set_user_type
    self.is_admin = false
  end

end
