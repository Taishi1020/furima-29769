class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_informations do |t|
      t.integer :user_id,   foregin_key: true
      t.integer :item_id,   foregin_key: true
      t.timestamps
    end
  end
end
