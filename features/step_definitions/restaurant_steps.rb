Then(/^I should be on the restaurant page for "([^"]*)"$/) do |name|
  restaurant = Restaurant.find_by(name: name)
  expect(current_path).to eq restaurant_path(restaurant)
end

Given(/^I am logged in as a restaurant owner$/) do
  user = FactoryGirl.create(:user, role: 'owner')
  login_as(user, scope: :user)
end
