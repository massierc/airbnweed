class UsersController < ApplicationController
  def index
    @all_dealers = User.select { |user| user.items != [] }
    @filtered_dealers = []
    Item.where(name: "#{params[:drug]}").map(&:user_id).each { |user| @filtered_dealers << User.find(user) }
    User.where(city: "#{params[:city]}").each { |user| @filtered_dealers << user }
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


