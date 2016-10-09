Given(/^the following restaurants exist$/) do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:restaurant, hash)
  end
end

Given(/^I am on restaurant page for "([^"]*)"$/) do |name|
  restaurant = Restaurant.find_by(name: name)
  visit restaurant_path(restaurant)
end

Then(/^"([^"]*)" should have a latitude$/) do |name|
  restaurant = Restaurant.find_by(name: name)
  expect(restaurant.latitude).not_to be nil
end

Given(/^my location is set to "([^"]*)" lat and "([^"]*)" lng$/) do |lat, lng|
  latitude, longitude = lat.to_f, lng.to_f
  simulate_location(latitude, longitude)
end

When(/^(?:I expect a Google map to load|the map has been loaded)$/) do
  sleep(1)
  expect(page).to have_css '#map .gm-style'
end


def simulate_location(lat, lng)
  page.execute_script("performGeolocation(#{lat}, #{lng})")
  sleep(1)
end


Then(/^I should see "([^"]*)" (?:marker|markers)$/) do |count|
  sleep(1)
  expected_count = page.evaluate_script('map.markers.length;')
  expect(expected_count).to eq count.to_i
end


Then(/^the center of the map should be approximately "([^"]*)" lat and "([^"]*)" lng$/) do |lat, lng|
  accepted_offset = 0.2
  center_lat = page.evaluate_script('map.getCenter().lat();')
  center_lng = page.evaluate_script('map.getCenter().lng();')
  expect(center_lat).to be_within(accepted_offset).of(lat.to_f)
  expect(center_lng).to be_within(accepted_offset).of(lng.to_f)
end

And(/^I click on the marker for "([^"]*)"$/) do |title|
  page.execute_script(" var m = map.markers.find(function(marker){
                                   return marker.title == '#{title}'
                                });
                       google.maps.event.trigger(m, 'click');
                      ")
  # it works in console but this script is causing errors the we activate js_errors for Poltergeist
end

Then(/^I should see an info window for Jam$/) do
  sleep(2)
  #Here we want to get the marker again and make sure that
  # marker.infoWindow.anchor.visible == true
end