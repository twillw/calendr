class RemoveEndTimeFromPatientAppointments < ActiveRecord::Migration
  def change
    remove_column :patient_appointments, :end_time, :time
  end
end
