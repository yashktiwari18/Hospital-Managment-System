class DashboardController < ApplicationController

    before_action :authenticate_user
    before_action :authorize_doctor


  def index
    @total_patients = Patient.count
    @total_doctors = Doctor.count
    @total_appointments = Appointment.count
  end
end