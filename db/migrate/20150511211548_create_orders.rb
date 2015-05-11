class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_no
      t.string :full_name
      t.string :company
      t.text :address
      t.text :delivery_address
      t.string :email
      t.string :phone
      t.string :mobile
      t.integer :quantity
      t.string :status

      t.timestamps null: false
    end
  end
end
