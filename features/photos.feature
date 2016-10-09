Feature: As a Restaurant Owner
  in order to make my dishes enticing
  I want to be able to upload a photo of a dish.

Background:
  Given I am logged in as a restaurant owner
  And I already have a restaurant
  And I have the following dishes:
    | name |
    | Cake |

Scenario: I add a photo to my dish
  Given I am on the edit dish page for "Cake"
  Then I should see "Upload an image"
