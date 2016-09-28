require 'pry'

class DishesController < ApplicationController
  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(sanitized_params)
    if @dish.save
      render :show
    else
      # Display flash message
      redirect_to new_dish_path # try to use render instead of redirect
    end
  end

  def show
    @dish = Dish.find(params[:id])
  end

  private
  def sanitized_params
    params.require(:dish).permit(:dish_name, :dish_desc, :dish_price, :dish_allergy, :dish_ingredients, :dish_cal)
  end
end
