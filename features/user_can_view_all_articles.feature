Feature: List articles on the index page
  
As a visitor
In order to choose an article to read
I would like to be able to see the articles listed on a page

  Background:
    Given the following categories exists
    |name    | id |
    |Sports  | 1  |
    |Politics| 2  |
    |Health  | 3  |    
    And the following user exists
    | first_name  | last_name    | email          | password | role      | id |
    | Hanna       | Nyman        | hanna@tuna.se  | password | journalist| 1  |
    And the following articles exists
    | title                | lede                          | created_at  | category_id | user_id |
    | A breaking news item | hello this is about me        | 2012-12-12  | 1           | 1       |

  Scenario: View list of articles on the index page
    When I visit the site
    Then I should see "A breaking news item"
    And I should see "Hanna"
    And I should see "hello this is about me"
    And I should see "Sports"


    