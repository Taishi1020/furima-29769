class FurimasController < ApplicationController
  def index
    @fuirma = Item.all
  end

  def edit
  end

  def update
    if current_user.update(furima_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def furima_params
    params.require(:furima).permit(:mame, :email)
  end
end
