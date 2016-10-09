Feature: As a Restaurant Owner
  in order to make my dishes enticing
  I want to be able to upload a photo of a dish.

Background:
  Given I am logged in as a restaurant owner
  And I already have a restaurant
  And I have the following dishes:
    | name |
    | Cake |
    | Soup |

Scenario: I add a photo to my dish
  Given I am on the edit dish page for "Cake"
  Then I should see "Upload an image"
  When I add an image to "Cake"
  And I click the "Submit" button
  Then I should be on the dish page for "Cake"
  And I should see a dish image

Scenario: I view a page with no dish image
  Given I am on the dish page for "Soup"
  Then I should not see the missing image placeholder
