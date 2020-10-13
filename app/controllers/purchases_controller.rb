class PurchasesController < ApplicationController
  def index
   # binding.pry
   @purchases = PurchaseInformation.new
   #redirect_to "/items/#{purchase_information.item.id}"
   @item = Item.find(params[:item_id])
  end

  def create
    
   @purchases = PurchaseInformation.new( purchase_informations_params)
   if @purchases.valid?
      pay_item
      @purcahses.save
    return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private
   
  def  purchase_information_params
     params.require(:purchase_information).permit(:postal_code, :prefectures_id, :city,  :addresses, :building_name,  :phone_code,  :purchase_informations,).merge(user_id: current_user.id, )
  end

  def purcahses
  end
    
  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price
      card: @token    
      currency:'jpy'                 
    )
  end
end

