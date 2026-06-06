class CreatePatients < ActiveRecord::Migration[8.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :phone
      t.text :address
      t.string :blood_group
      t.date :dob
      t.string :emergency_contact
      t.text :allergies
      t.text :medical_history
      t.references :user, null: false, foreign_key: true
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end
