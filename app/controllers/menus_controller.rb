class MenusController < ApplicationController
  before_action :find_menu_from_params, only: [:show, :edit, :update]

  load_and_authorize_resource

  def index
  end

  def new
    if current_user.owner? && Restaurant.exists?(user: current_user)
      @menu = Menu.new
    else
      flash[:alert] = 'Please create your restaurant before continuing'
      redirect_to new_restaurant_path
    end
  end

  def show
  end

  def create
    restaurant = Restaurant.find_by(user: current_user)
    @menu = Menu.new(menu_params.merge({restaurant: restaurant}))
    if @menu.save
      flash[:notice] = 'Successfully added menu'
      render :show
    else
      flash[:alert] = @menu.errors.full_messages.first
      render :new
    end
  end

  def edit
    @dishes = Dish.all #this needs to be restricted to only dishes created by the restaurant later on
  end

  def update
    @menu.update(menu_params)
    render :show
  end

  private
  def menu_params
    params.require(:menu).permit(:title, {dish_ids: []})
  end

  def find_menu_from_params
    @menu = Menu.find(params[:id])
  end
end
