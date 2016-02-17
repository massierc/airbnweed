class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    @item.in_stock = true
    @item.user = current_user
    @item.save
    redirect_to user_path(current_user)
  end

  private

  def item_params
    params.require(:item).permit(:name, :price)
  end
end
