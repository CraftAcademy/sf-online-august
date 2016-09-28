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
    | Allergy Info     | gluten               |
    | Ingredients      | cheese, sauce, crust |
    | Calories         | 10000                |
  When I click the "Add a Dish" button
  Then I should be on the dish page for "Pizza"
  And I should see:
    | content              |
    | Pizza                |
    | Delicious pizza      |
    | 7000                 |
    | gluten               |
    | cheese, sauce, crust |
    | 10000                |
