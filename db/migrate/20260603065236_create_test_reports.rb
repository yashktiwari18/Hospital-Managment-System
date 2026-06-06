class CreateTestReports < ActiveRecord::Migration[8.1]
  def change
    create_table :test_reports do |t|
      t.references :patient, null: false, foreign_key: true
      t.string :test_type
      t.text :result

      t.timestamps
    end
  end
end
