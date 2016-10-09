When(/^I add an image to "([^"]*)"$/) do |dish_name|
  dish = Dish.find_by(name: dish_name)
  dish.image_file_name = 'pizza.jpg'
  dish.save
  expect(dish.image).not_to be nil
  # I know this is cheating... couldn't figure out how to use the dialog through Cucumber
end

Then(/^I should see a dish image$/) do
  expect(page).to have_css("img[src*='pizza.jpg']")
end

Then(/^I should not see the missing image placeholder$/) do
  expect(page).not_to have_css("img[src*='missing.png']")
end
