class DishesController < ApplicationController
  def new
  end

  def create
    dish = Dish.new
  end
end
