module DrAvailabilitiesHelper

  def create_availabilities_for_each_day(params)
    @days_of_the_week = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
    i = 0
    while i < 7
      @dr_availability = DrAvailability.new(clinic_open: params[:dr_availabilities][i][:clinic_open], clinic_close: params[:dr_availabilities][i][:clinic_close], avg_appt_time: params[:dr_availabilities][i][:avg_appt_time], day: @days_of_the_week[i], doctor_id: session[:doctor_id])
      @dr_availability.save
      i += 1
      @dr_availability
    end
  end

  private

  def check_doctor_login
    if session[:doctor_id] == nil
      redirect_to login_users_path
      @current_doctor = session[:doctor_id]
    end
  end
end
