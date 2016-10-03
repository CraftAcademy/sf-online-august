Feature: As a restaurant Owner
  in order to sell food
  I need to be able to display information on my Restaurant page.

Background:
  Given I am logged in as a restaurant owner

Scenario: I create a restaurant
  Given I am on the "create restaurant" page
  When I fill in:
    | element     | content              |
    | Name        | Awesome restaurant   |
    | Description | Good food            |
    | Street      | Holtermansgatan 17d  |
    | Zipcode     | 41235                |
    | Town        | Göteborg             |
  And I click the "Create" button
  And I should see "here is the show"
  And I should see "Awesome restaurant"

Scenario: I attempt to create a restaurant with no address
  Given I am on the "create restaurant" page
  When I fill in:
    | element     | content              |
    | Name        | Awesome restaurant   |
    | Description | Good food            |
    | Street      |                      |
    | Zipcode     | 41235                |
    | Town        | Göteborg             |
  And I click the "Create" button
  And I should see "Street can't be blank"
