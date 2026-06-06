class AddExtraFieldsToMedicalRecords < ActiveRecord::Migration[8.1]
  def change
    add_column :medical_records, :follow_up_date, :date
    add_reference :medical_records, :appointment, null: false, foreign_key: true
  end
end
