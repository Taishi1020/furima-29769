class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string      :postal_code,           null:false
      t.integer     :prefectures_id,        null:false
      t.string      :city,                  null:false
      t.string      :addresses,             null:false
      t.string      :building_name        
      t.string      :phone_code,            null:false
      t.references  :purchase_informations,  foregin_key: true
      t.timestamps
    end
  end
end
