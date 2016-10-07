require 'rails_helper'

RSpec.describe RestaurantHelper do

  it "returns the restaurant categories, plus 'All Restaurants'" do
    category_list = RestaurantHelper.dropdown_options
    expect(category_list.length).to eq (Restaurant::PERMITTED_CATEGORIES.length + 1)
  end
end
