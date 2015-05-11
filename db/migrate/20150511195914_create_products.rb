class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :image
      t.float :price
      t.date :available_start_date
      t.date :available_end_date

      t.timestamps null: false
    end
  end
end
