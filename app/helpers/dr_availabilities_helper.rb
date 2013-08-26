module DrAvailabilitiesHelper

  def create_availabilities_for_each_day(params)
    @days_of_the_week = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
    i = 0
    while i < 7
      @dr_availability = DrAvailability.new(clinic_open: params[:dr_availabilities][i][:clinic_open], clinic_close: params[:dr_availabilities][i][:clinic_close], avg_appt_time: params[:dr_availabilities][i][:avg_appt_time], day: @days_of_the_week[i], doctor_id: @current_user.id)
      @dr_availability.save
      i += 1
    end
  end

  def get_day_of_week_from_date(current_date)
    dates_array = current_date.split(" ")
    day = dates_array[0].to_s.downcase!
    if day == "mon" || day == "fri" || day == "sun"
      current_day_of_the_week = day + "day"
    elsif day == "tue"
      current_day_of_the_week = day + "sday"
    elsif day == "wed"
      current_day_of_the_week = day + "nesday"
    elsif day == "thu"
      current_day_of_the_week = day + "rsday"
    elsif day == "sat"
      current_day_of_the_week = day + "urday"
    end
    current_day_of_the_week
  end

    def split_schedule_into_appts(day)
    @current_schedule = DrAvailability.find_by(doctor_id: @current_user, day: day)
    appt_times = []
    time = @current_schedule.clinic_open
    while time < @current_schedule.clinic_close
      appt_times.push(time)
      time += @current_schedule.avg_appt_time.minutes
    end
    appt_times
  end
end
