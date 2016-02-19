class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    if params[:drug].nil? || params[:drug] == ""
      drug = User.select { |dealer| dealer.items.length > 0 }
    else
      params[:drug] = [params[:drug]] if params[:drug].class == String
      drug = User.select { |dealer| dealer.items.length > 0 }
      params[:drug].each do |drug_param|
        drug = drug.select { |dealer| Item.where(name: "#{drug_param}").map(&:user_id).include? dealer.id }
      end
    end

    if params[:city] == ""
      city = drug
    else
      city = drug.select { |dealer| dealer.city == params[:city] }
    end

    if params[:time] == ""
      @filtered_dealers = city
    else
      @filtered_dealers = city.select do |dealer|
        dealer.start_time < params[:time].to_i && dealer.end_time > params[:time].to_i
      end
    end

    @markers = Gmaps4rails.build_markers(@filtered_dealers) do |dealer, marker|
      marker.lat dealer.latitude
      marker.lng dealer.longitude
    end
  end

  def show
    @user = User.find(params[:id])
    @deal = Deal.new
    @item = Item.new
    @marker = Gmaps4rails.build_markers(@user) do |dealer, marker|
      marker.lat dealer.latitude
      marker.lng dealer.longitude
    end
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
    params.require(:user).permit(:first_name, :last_name, :address, :zipcode, :city, :photo, :start_time, :end_time, :description)
  end
end
