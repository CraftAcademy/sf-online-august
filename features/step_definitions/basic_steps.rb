Given(/^I am on the "([^"]*)" page$/) do |page|
  set_goto(page)
  visit @goto
end

Then(/^I should be on the "([^"]*)" page$/) do |page|
  set_goto(page)
  visit @goto
  expect(current_path).to eq @goto
end

Then(/^I should see:$/) do |table|
  table.hashes.each do |hash|
    expect(page).to have_content hash[:content]
  end
end

When(/^I fill in:$/) do |table|
  table.hashes.each do |hash|
      fill_in hash[:element], with: hash[:content]
  end
end

When(/^I click the "([^"]*)" button$/) do |button|
  click_button button
end



private

def set_goto(page)
  @goto = new_dish_path if page == "Create Dish"
  @goto = restaurant_path if page == "restaurant"
end
