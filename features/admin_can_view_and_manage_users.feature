Feature: Admin can assign roles to users

    As an Admin
    In order to allow users to create articles
    I want to be able to assign different roles to specific users

    Background:

        Given the following user exists
            | first_name | last_name    | email          | password | role   |
            | Hanna      | Nyman        | hanna@tuna.se  | password | admin  |
            | William    | Schneiderman | will@gmail.com | password | member |
        And I am logged in as "hanna@tuna.se"
        And I click "Users"

    Scenario: Admin can see all users
        Then I should see "William Schneiderman"
        And I should see "will@gmail.com"
        And I should see "Role: member"
    
    Scenario: Admin can change user roles
        When I select "journalist" from "role"
        And I click "Save"
        Then I should see "William Schneiderman"
        And I should see "will@gmail.com"
        And I should see "Role: journalist"
    