Feature: Create articles
  As a journalist,
  In order to write articles
  I would like to be able to have an article creation form

  Background:
    Given the following user exists
    | first_name  | last_name    | email          | password | role      |
    | Hanna       | Nyman        | hanna@tuna.se  | password | journalist|
    | William     | Schneiderman | will@gmail.com | password | member    |
    
    And the following categories exists
    |name    |
    |Sports  |
    |Politics|
    |Health  |
    
  Scenario: Journalist navigates to create article page
    When I am logged in as "hanna@tuna.se"
    And I click "My account"
    And I click "New Article"
    Then I am on Create article page

  Scenario: Non-journalist navigates to create article page
    When I am logged in as "will@gmail.com"
    Then I should not see "New Article"
    
  Scenario: Successfully create an article [Happy Path]
    When I am logged in as "hanna@tuna.se"
    And I click "My account"
    And I click "New Article"
    And I fill in "Title" with "Learning Rails 5"
    And I fill in "Lede" with "This is the lede paragraph"
    And I fill in "Body" with "Excited about learning a new framework"
    And I attach a file
    And I select "Politics" from "Category"
    And I click "Create Article" 
    Then I should be on journalist index page
    And I should see "Learning Rails 5"
    And I should see "This is the lede paragraph"

  Scenario: Create an article [Sad Path]
    When I am logged in as "hanna@tuna.se"
    And I click "My account"
    And I click "New Article"
    And I click "Create Article"
    Then I should see "3 errors prohibited this article from being saved"