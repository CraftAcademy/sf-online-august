Feature: As a registered Customer
  in order to get my food
  I need to be able to check out.

Scenario: Viewing the order page
    Given I am on the "order" page
    And am a registered Customer
    Then I should see:
      | content              |
      | List of cart items   |
      | List of item prices  |
      | Total prices         |
      | The Pay button       |
