class Preference < ActiveRecord::Base
  belongs_to :patient_appointment
end
