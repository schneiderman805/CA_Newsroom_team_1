Feature: User can log in and out

  As a Subscriber
  In order to access the premium content
  I would like to log in

  Background: 
    Given the following user exists
    | first_name  | last_name | email         | password | password_confirmation |
    | Hanna       | Nyman     | hanna@tuna.se | password | password              |
    
    And I visit the site
    And I click 'Log in'

  Scenario: If user fills in the login form correctly she can log in
    When I fill in 'Email' with 'hanna@tuna.se'
    And I fill in 'Password' with 'password'
    And I click 'Submit'
    Then I should see 'Hello, Hanna!'

  Scenario: If user fills in the login form incorrectly she will see an error message
    When I click 'Submit'
    Then I should see 'Invalid Email or password.'
  
  Scenario: User can log out when logged in
    Given I am logged in as 'hanna@tuna.se'
    When I click 'Log out'
    Then I should not see 'Hello, Hanna!'