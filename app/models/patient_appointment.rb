class PatientAppointment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :dr_availability

  validates_uniqueness_of :start_time, scope: :date
end
