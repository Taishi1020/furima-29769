class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :ship_from_area,      null: false
      t.integer :shipping_days,       null: false
      t.string  :product_name,        null: false
      t.integer :category,            null: false
      t.string  :method_of_payment,   null: false
      t.integer :product_conditon,    null: false
      t.integer :product_burden,      null: false
      t.integer :price,               null: false
      t.integer :days,                null: false
      t.timestamps
    end
  end
end
