class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text    :shipping_area,       null: false
      t.integer :shipping_days,       null: false
      t.string  :product_name,        null: false
      t.string  :category,            null: false
      t.string  :method_of_payment,   null: false
      t.text    :product_explanation, null: false
      t.text    :product_image,       null: false
      t.integer :price,               null: false
      t.integer :days,                null: false
      t.timestamps
    end
  end
end
