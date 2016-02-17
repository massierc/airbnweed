class UsersController < ApplicationController
  def index
    drug = User.select { |dealer| Item.where(name: "#{params[:drug]}").map(&:user_id).include? dealer.id }
    city = drug.select { |dealer| dealer.city == params[:city] }
    @filtered_dealers = city.select do |dealer|
      dealer.start_time < params[:time].to_i && dealer.end_time > params[:time].to_i
    end
  end

  def show
    @user = User.find(params[:id])
    @deal = Deal.new
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    current_user.update(user_params)
    redirect_to user_path
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :address, :zipcode, :city, :photo)
  end
end
