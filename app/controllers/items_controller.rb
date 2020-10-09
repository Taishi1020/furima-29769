class ItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:od])
    item.update(item_params)
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :category_id, :product_description, :ship_form_area_id, :shipping_days_id, :price, :product_condition_id, :product_burden_id).merge(user_id: current_user.id)
  end
end
