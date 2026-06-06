class AddRoomToPatients < ActiveRecord::Migration[8.1]
  def change
    add_reference :patients, :room, null: true, foreign_key: true
  end
end
