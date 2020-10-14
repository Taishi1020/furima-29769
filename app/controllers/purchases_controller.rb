class PurchasesController < ApplicationController
  def index
  
   @purchases = UserDonation.new
   #redirect_to "/items/#{purchase_information.item.id}"
   @item = Item.find(params[:item_id])
  end

  def create
    
   @purchases = UserDonation.new( purchase_information_params)
   @item = Item.find(params[:item_id])
   if @purchases.valid?
      @purchases.save
    return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private
   
  def  purchase_information_params
     params.require(:user_donation).permit(:postal_code, :prefecture_id, :city,  :addresses, :building_name,  :phone_code, :purchase_informations, :item_id, :token).merge(user_id: current_user.id  )
  end

  def donnation_params
    params.require(:user_donation).permit(:name, :name_reading, :nickname, :postal_code, :prefecture_id, :city, :addresses, :building_name, :price)
  end
    
  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,
      card: usaer_donation_params[:token],
      currency:'jpy'                 
    )
  end
end

