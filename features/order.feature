Feature: As a registered Customer
  in order to get my food
  I need to be able to check out.

Scenario: Viewing the checkout page
    Given I am on the "checkout" page
    Then I should see:
      | content              |
      | List of cart items   |
      | List of item prices  |
      | Total prices         |
      | The Pay button       |
