class RestaurantsController < ApplicationController
  load_and_authorize_resource # potentially refactor this into ApplicationController

  def index
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params.merge({user: current_user}))
    if @restaurant.save
      render :show
    else
      flash[:alert] = @restaurant.errors.full_messages.first
      render :new
    end
  end

  def show
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :street, :zipcode, :town)
  end
end
