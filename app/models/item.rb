class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :ShipFormArea
  belongs_to_active_hash :shipping_days
  belongs_to_active_hash :product_burden
  belongs_to_active_hash :ship_form_area
  has_one_attached :image

  

 
# 選択関係で「---」のままになっていないか検証
  with_options numericality: { other_than: 1, message: '1' }
   validates :category_id
   validates :product_condition_id
   validates :product_burden_id, 
   validates :ship_form_area_id,  
   validates :shipping_days_id,  
  end

  with_options presence: true do
   validates :image
    validates :product_name
    validates :product_description
    validates :category_id           
    validates :product_condition_id  
    validates :product_burden_id
    validates :ship_form_area_id    
    validates :shipping_days_id 
    validates :price, format: { with: /\A[300-9999999]+\z/, message: "Price Out of setting range" }
  end
end
