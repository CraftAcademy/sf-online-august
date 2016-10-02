class MenusController < ApplicationController
  def index
  end

  def new
    @menu = Menu.new
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      flash[:notice] = "Successfully added menu"
      render :show
    else
      flash[:alert] = @menu.errors.full_messages.first
      render :new
    end
  end

  def edit
    @menu = Menu.find(params[:id])
    @dishes = Dish.all #this needs to be restricted to only dishes created by the restaurant later on
  end

  def update
    @menu = Menu.find(params[:id])
    @menu.update(menu_params)
    # params[:menu][:dish_ids].each do |dish|
    #   @menu.dish_ids << dish
    #   @menu.save
    # end
    # binding.pry
    render :show
  end

  private
  def menu_params
    params.require(:menu).permit(:title, {dish_ids: []})
  end
end
