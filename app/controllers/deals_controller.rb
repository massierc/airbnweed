class DealsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def accept
    @deal = Deal.find(params[:id])
    @deal.update(status: "accepted")
    redirect_to(:back)
  end

  def cancel
    @deal = Deal.find(params[:id])
    @deal.update(status: "cancelled")
    redirect_to(:back)
  end

  def create
    @deal = Deal.new(deal_params)
    @deal.status = "pending"
    @deal.user = current_user
  end

  def rate
    @deal = Deal.find(params[:id])
    @deal.update(rating: params[:rating])
    redirect_to(:back)
  end

  private



  def deal_params
    params.require(:deal).permit(:user, :total_price, :item)
  end
end
