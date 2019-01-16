Feature: User can see the details of a specific article 

  As a user
  In order to read an article
  I would like to be able to click on an article and have it displayed

  Background: 
    Given the following categories exists
    |name    | id |
    |Sports  | 1  |
    |Politics| 2  |
    |Health  | 3  |    
    And the following user exists
    | first_name  | last_name    | email          | password | role      | id |
    | Hanna       | Nyman        | hanna@tuna.se  | password | journalist| 1  |
    | John        | Doe          | john@doe.se    | password | journalist| 2  |

    And the following articles exists
    | title                | body                          | created_at  | category_id | user_id |
    | A breaking news item | hello this is about me        | 2012-12-12  | 1           | 1       |
    | Learn Rails 5        | hello this is about that guy  | 2013-11-11  | 3           | 2       |

    Scenario: User can see the details of a specific article 
      When I visit the site
      And I click 'A breaking news item' 
      Then I should see 'Hanna'
      And I should see 'hello this is about me'
      And I should see '2012-12-12'
      And I should see 'Sports'
      When I click 'back'
      And I click 'Learn Rails 5'
      Then I should see 'hello this is about that guy' 
      And I should see 'John'
      And I should see '2013-11-11' 
      And I should see 'Health' 