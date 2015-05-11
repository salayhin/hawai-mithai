class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :order_id
      t.string :payment_type
      t.float :amount
      t.string :account_number
      t.date :payment_date
      t.string :receipt_image

      t.timestamps null: false
    end
  end
end
