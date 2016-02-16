class UsersController < ApplicationController
  def index
    @dealers = User.select { |user| user.items != [] }
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
  end

  def destroy
  end
end
