class AddProductIdToOrdersTable < ActiveRecord::Migration
  def change
    add_column :orders, :product_id,:integer
  end
end
