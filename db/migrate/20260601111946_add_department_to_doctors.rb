class AddDepartmentToDoctors < ActiveRecord::Migration[8.1]
  def change
    add_column :doctors, :department, :string
  end
end
