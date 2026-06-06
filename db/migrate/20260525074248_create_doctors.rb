class CreateDoctors < ActiveRecord::Migration[8.1]
  def change
    create_table :doctors do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :phone
      t.text :address
      t.string :specialization
      t.string :education
      t.string :field

      t.timestamps
    end
  end
end
