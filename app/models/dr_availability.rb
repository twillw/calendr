class DrAvailability < ActiveRecord::Base

  belongs_to :doctor
  before_save :set_correct_time_format


  def set_correct_time_format
    self.clinic_open = format_time(self.clinic_open)
    self.clinic_close = format_time(self.clinic_close)
  end

  private

  def format_time(selected_time)
    selected_time.strftime("%H:%M") if selected_time
  end

end
