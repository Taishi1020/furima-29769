class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :product_name,                null:false
      t.integer :category_id,                 null:false
      t.text    :product_description,         null:false
      t.integer :ship_from_area_id,           null:false
      t.integer :shipping_days_id,            null:false
      t.integer :price,                       null:false
      t.integer :product_condition_id,        null:false
      t.integer :product_burden_id,           null:false
      t.integer :user_id,                     null:false
      t.timestamps
    end
  end
end
