class CreateBills < ActiveRecord::Migration[8.1]
  def change
    create_table :bills do |t|
      t.references :appointment, null: false, foreign_key: true
      t.decimal :amount
      t.string :status
      t.string :payment_method

      t.timestamps
    end
  end
end
