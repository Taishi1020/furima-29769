class FurimasController < ApplicationController
  def index
    @fuirma = Item.all
  end

  def edit
  end

  def update
    if current_user.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def create
    nickname(nickname: params[:nickname])
  end
end
