class Api::V1::CartsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :find_or_create_cart, only: [:update]

  def create
    dish = Dish.find(params[:dish_id])
    cart = ShoppingCart.create
    cart.add dish, dish.price
    render json: ({cart_id: cart.id, dish_id: cart.shopping_cart_items[0].item.id})
  end

  def update
    dish = Dish.find(params[:dish_id])
    @cart.add(dish, dish.price)
  rescue
    render json: ({'error' => 'Dish ID was invalid'})
  end

  private
  def find_or_create_cart
    @cart = ShoppingCart.find_or_create_by(id: params[:id])
  end

end
