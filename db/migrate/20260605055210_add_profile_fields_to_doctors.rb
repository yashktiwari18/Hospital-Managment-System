class AddProfileFieldsToDoctors < ActiveRecord::Migration[8.1]
  def change
    add_column :doctors, :qualification, :string
    add_column :doctors, :experience, :integer
    add_column :doctors, :consultation_fee, :integer
    add_column :doctors, :about, :text
  end
end
