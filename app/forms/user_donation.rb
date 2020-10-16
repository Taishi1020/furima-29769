class UserDonation

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_code, :item_id, :postal_code, :token, :user_id

  with_options presence: true do
   validates :token
   validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "Postal code Input correctly"}
   validates :prefecture_id 
   validates :city
   validates :addresses
   validates :phone_code, format: {with: /\A\d{11}\z/, message: "Phone number Input only number"}
   validates :user_id
   validates :item_id
  end


  def save
     # 寄付金の情報を保存
    purchase_information  = PurchaseInformation.create(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, phone_code: phone_code, addresses: addresses, building_name: building_name, purchase_information_id: purchase_information.id)
   
    
  end
end
  