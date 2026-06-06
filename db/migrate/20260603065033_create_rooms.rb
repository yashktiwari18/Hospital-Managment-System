class CreateRooms < ActiveRecord::Migration[8.1]
  def change
    create_table :rooms do |t|
      t.string :room_number
      t.string :room_type
      t.integer :capacity
      t.boolean :availability

      t.timestamps
    end
  end
end
