Feature: List articles on the index page

  As a visitor
  In order to choose an article to read
  I would like to be able to see the articles listed on a page

  Background:
    Given the following categories exists
      | name     |
      | Sports   |
      | Politics |
      | Health   |
      | Economy  |      
    And the following user exists
      | first_name | last_name | email         | password | role       |
      | Hanna      | Nyman     | hanna@tuna.se | password | journalist |
    And the following articles exists
      | title                | lede                   | created_at | category_id | user_id |published|
      | A breaking news item | hello this is about me | 2012-12-12 | Sports      | Hanna   |true     |

  Scenario: View list of articles on the index page
    When I visit the site
    Then I should see "A breaking news item"
    And I should see "Hanna"
    And I should see "hello this is about me"
    And I should see "Sports"
    And I should see "Articles"
    And I should see "Author"
    And I click "Svenska"
    Then I should see "Artiklar"
    And I should see "Författare"

  Scenario: User can see category bar
    When I visit the site
    Then I should see 'Sports' in navbar
    Then I should see 'Politics' in navbar
    Then I should see 'Health' in navbar
    Then I should see 'Economy' in navbar