class AddUserIdToDoctors < ActiveRecord::Migration[8.1]
  def change
    add_reference :doctors, :user, foreign_key: true
  end
end
