Feature: As a restaurant Owner
  in order to sell food
  I need to be able to add one or more dishes to my menus.

Scenario: I edit my menu
  Given the following dishes exist
    | dish_name | dish_desc       | dish_price |
    | Pizza     | Delicious pizza | 7000       |
    | Salad     | Leafy           | 1500       |
  And I am on the "edit menu" page
  Then I should see "Title"
  And I should see "Dishes"
