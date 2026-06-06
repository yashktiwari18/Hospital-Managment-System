class AddFieldsToMedicalRecords < ActiveRecord::Migration[8.1]
  def change
    add_column :medical_records, :chief_complaint, :string
    add_column :medical_records, :symptoms, :text
    add_column :medical_records, :doctor_notes, :text
    
  end
end
