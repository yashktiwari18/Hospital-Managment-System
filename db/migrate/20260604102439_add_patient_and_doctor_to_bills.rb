class AddPatientAndDoctorToBills < ActiveRecord::Migration[8.1]
  def change
    add_reference :bills, :patient, foreign_key: true
    add_reference :bills, :doctor, foreign_key: true
  end
end
