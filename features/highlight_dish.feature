Feature: As a restaurant Owner
  in order to market my food
  I need to show particular Dishes on my Restaurant page, with order option.

Background:
  Given I am logged in as a restaurant owner
  And I already have a restaurant
  And the following dishes exist
    | name   | description     | price |
    | Pizza  | Delicious pizza | 70    |
    | Salad  | Leafy           | 65    |
    | Olives | Salty           | 90    |

Scenario: I add a dish to the highlight list
  Given I am on the edit dish page for "Pizza"
  When I check the "Highlight" box
  And I click the "Submit" button
  When I am on my restaurant page
  Then I should see "Pizza"
  And I should see "Add to cart"