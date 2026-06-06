class PatientDashboardController < ApplicationController
  def index

    @appointments =
      current_user.patient.appointments.count

    @pending_bills =
      Bill.joins(:appointment)
          .where(
            appointments: {
              patient_id: current_user.patient.id
            }
          )
          .where(status: "Pending")
          .count

  end
end