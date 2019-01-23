Feature: Edit/delete articles
  As a Journalist,
  In order to change articles I have already written
  I would like to be able to edit & delete articles

  Background:
    Given the following user exists
      | first_name | last_name | email         | password | role       |
      | Hanna      | Nyman     | hanna@tuna.se | password | journalist |

    And the following categories exists
      | name     |
      | Sports   |
      | Politics |

    And the following articles exists
      | title                | lede                   | user_id | category_id | published |
      | A breaking news item | hello this is about me | Hanna   | Sports      | true      |


    And I am logged in as "hanna@tuna.se"
    And I click "My account"
    Then I should see "A breaking news item"

  Scenario: Successfully edit an article
    When I click "Edit"
    And I fill in "Title" with "Learning Rails 5"
    And I fill in "Lede" with "This is the lede paragraph"
    And I fill in "Body" with "Excited about learning a new framework"
    And I select "Politics" from "Category"
    And I click "Update Article"
    Then I should be on journalist index page
    And I should see "Learning Rails 5"
    And I should see "This is the lede paragraph"

  @javascript
  Scenario: Successfully delete an article
    When I click "Delete"
    And I click to accept the alert message
    Then I should not see "A breaking news item"