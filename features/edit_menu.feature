Feature: As a restaurant Owner
  in order to sell food
  I need to be able to add one or more dishes to my menus.

Scenario: I edit my menu
  Given the following dishes exist
    | dish_name | dish_desc       | dish_price |
    | Pizza     | Delicious pizza | 7000       |
    | Salad     | Leafy           | 1500       |
    | Olives    | Salty           | 900        |
  And the following menus exist:
    | title |
    | Lunch |
  And I am on the edit menu page for "Lunch"
  Then I should see:
    | content    |
    | Title      |
    | add dishes |
    | Pizza      |
    | Salad      |
    | Olives     |
  When I check the "Pizza" box
  And I check the "Olives" box
  And I click the "Update" button
  Then I should be on the menu page for "Lunch"
  And I should see "Pizza"
  And I should not see "Salad"
