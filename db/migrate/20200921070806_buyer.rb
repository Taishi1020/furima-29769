class Buyer < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer do |t|
      t.integer :phone_numder,  null: false
      t.string  :buyer_abbress, null: false
      t.integer :postal_cood,   null: false
    end
  end
end
