class ItemsController < ApplicationController
  before_action :basic_auth

 # def index
   # @items = Item.all
 # end

  def new
    @item = Item.new
 end

  def edit
  end

  #def update
   # if current_user.update(item_params)
    #  redirect_to root_path
   # else
    #  render :edit
   # end
  #end

  def create
    @item = Item.new(item_params)
    if @item.valid?
       @item.save
      return redirect_to  root_path
    else
      render 'new'
    end
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def item_params
    params.require(:item).permit(:image, :product_name, :category_id, :product_description, :ship_form_area_id, :shipping_days_id, :price,  :product_condition_id, :product_burden_id).merge(user_id: current_user.id)
  end
end

