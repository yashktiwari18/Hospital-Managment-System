class MakeAppointmentIdNullableInPrescriptions < ActiveRecord::Migration[8.0]
  def change
    change_column_null :prescriptions, :appointment_id, true
  end
end