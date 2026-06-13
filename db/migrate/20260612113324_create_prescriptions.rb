class CreatePrescriptions < ActiveRecord::Migration[8.1]
  def change
    create_table :prescriptions do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.references :appointment, null: false, foreign_key: true
      t.string :medicine_name
      t.string :dosage
      t.string :frequency
      t.string :duration
      t.text :remarks

      t.timestamps
    end
  end
end
