Feature: As a restaurant Owner
  in order to set up my menu
  I need to be able to create Dishes.

Scenario: I create a dish
  Given I am on the "Create Dish" page
  Then I should see:
    | content             |
    | Add a Dish          |
    | Dish Name           |
    | Dish description    |
    | Price               |
    | Allergy Info        |
    | Ingredients         |
    | Calories            |
  When I fill in:
    | element          | content              |
    | Dish Name        | Pizza                |
    | Dish description | Delicious pizza      |
    | Price            | 7000kr               |
    | Allergy info     | gluten               |
    | Ingredients      | cheese, sauce, crust |
    | Calories         | 10000                |
  Then I should be on the "dish" page
  And I should see:
    | content             |
    | Dish Name           |
    | Dish description    |
    | Price               |
    | Allergy Info        |
    | Ingredients         |
    | Calories            |
