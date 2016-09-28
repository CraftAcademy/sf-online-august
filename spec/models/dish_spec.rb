require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe 'Regression validations' do
    it { is_expected.to have_db_column :dish_name }
    it { is_expected.to have_db_column :dish_desc }
    it { is_expected.to have_db_column :dish_price }
    it { is_expected.to have_db_column :dish_allergy }
    it { is_expected.to have_db_column :dish_cal }
    it { is_expected.to have_db_column :dish_ingredients }
  end
end
