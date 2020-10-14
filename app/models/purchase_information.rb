class PurchaseInformation < ApplicationRecord
  belongs_to :user
  belongs_to :item
  attr_accessor , :postal_code, :prefectures_id, :city,  :addresses, :building_name,  :phone_code, :purchase_informations, :item_id, :user_id
end
