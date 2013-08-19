class PatientAppointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :dr_availability
end
