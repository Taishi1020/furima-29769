class Shipping < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_address do |t|
      t.integer  :shipping_days,      null: false
      t.string   :buyer_address,      null: false
      t.text     :buyer_information,  null: false
    end
  end
end
