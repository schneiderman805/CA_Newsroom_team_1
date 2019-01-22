Feature: Subscriber can comment on article

  As a Subscriber
  In order to voice my opinion or ask questions
  I would like to be able to leave a comment on an article

  Background:
    Given the following user exists
      | first_name | last_name    | email          | password | role       |
      | William    | Schneiderman | will@gmail.com | password | member     |
      | Bob        | Schneiderman | bob@gmail.com  | password | journalist |

    And the following articles exists
      | title                | lede                   | author | category_id | user_id | published |
      | A breaking news item | hello this is about me | Shahin | Sports      | Bob     | true      |
    And I visit the site

  Scenario: Subscriber can submit a comment [happy path]
    And I am logged in as "will@gmail.com"
    When I click "A breaking news item"
    And I fill in "Body" with "This is my comment"
    And I click "Create Comment"
    Then I should see "William"
    And I should see "This is my comment"

  Scenario: Non-subscriber can not submit a comment [sad path]
    When I click "A breaking news item"
    Then I should not see "Body"
    And I should not see "Create Comment"

  Scenario: Subscriber can not submit a blank comment [sad path]
    Given I am logged in as "will@gmail.com"
    When I click "A breaking news item"
    And I fill in "Body" with ""
    And I click "Create Comment"
    Then I should see "Please fill in comment"