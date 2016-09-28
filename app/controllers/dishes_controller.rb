require 'pry'

class DishesController < ApplicationController
  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_name: params[:dish][:dish_name], dish_desc: params[:dish][:dish_desc], dish_price: params[:dish][:dish_price])
    if @dish.save
      redirect_to dish_path(@dish)
    else
      redirect_to new_dish_path
    end
  end

  def show
    @dish = Dish.find(params[:id])
  end
end
