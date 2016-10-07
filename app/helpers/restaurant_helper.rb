module RestaurantHelper
  def create_dropdown_options
    @select_options = Restaurant::PERMITTED_CATEGORIES.dup.insert(0, 'All Restaurants')
  end
end
