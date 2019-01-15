Feature: Subscriber can comment on article
  
  As a Subscriber
  In order to voice my opinion or ask questions
  I would like to be able to leave a comment on an article

  Background:
    Given the following user exists
    | first_name  | last_name    | email          | password | role      |
    | William     | Schneiderman | will@gmail.com | password | member    |
    And the following categories exists
    |name    | id |
    |Sports  | 1  |
    And the following articles exists
    | title                | lede                         | author  | category_id |
    | A breaking news item | hello this is about me       | Shahin  | 1           |
    And I visit the site
    And I am logged in as "will@gmail.com"
    And I click "A breaking news item"

  Scenario: Successfully submit a comment
    When I fill in "Commenter" with "William"
    And I fill in "Body" with "This is my comment"
    And I click "Create Comment"
    Then I should see "William"
    And I should see "This is my comment"