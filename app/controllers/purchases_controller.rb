class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
   @purchases = UserDonation.new
   if current_user.id == @item.user_id || @item.purchase_information != nil 
    redirect_to root_path
   end
  end

  def create
   @purchases = UserDonation.new( purchase_information_params)
   if @purchases.valid?
      pay_item
      @purchases.save
    return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private
   
  def  purchase_information_params
     params.require(:user_donation).permit(:postal_code, :prefecture_id, :city,  :addresses, :building_name,  :phone_code).merge(user_id: current_user.id, token: params[:token], item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def donnation_params
    params.require(:user_donation).permit(:name, :name_reading, :nickname, :postal_code, :prefecture_id, :city, :addresses, :building_name, :price )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_information_params[:token],
      currency:'jpy'                 
    )
  end
end

