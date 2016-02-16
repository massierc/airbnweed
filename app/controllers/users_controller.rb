class UsersController < ApplicationController
  def index
    @all_dealers = User.select { |user| user.items != [] }
    @filtered_dealers = []
    Item.where(name: "#{params[:drug]}").map(&:user_id).each { |user| @filtered_dealers << User.find(user) }
    User.where(city: "#{params[:city]}").each { |user| @filtered_dealers << user }
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end


