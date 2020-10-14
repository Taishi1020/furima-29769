class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:edit, :show, :update, :destroy ]
  before_action :check_item_user, only: [:edit]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def edit 
  end

  def update
    if @item.update(item_params)
       redirect_to root_path
    else
      render :edit
    end
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
  end

  def destroy
    if @item.destroy
     redirect_to root_path
    else
     render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :category_id, :product_description, :ship_form_area_id, :shipping_days_id, :price, :product_condition_id, :product_burden_id).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  def check_item_user
    if user_signed_in? && current_user != @item.user
      redirect_to root_path
    end
  end

end

