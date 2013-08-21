class PatientAppointment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :dr_availability
end
