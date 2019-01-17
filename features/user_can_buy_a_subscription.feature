@javascript @stripe
Feature: User can buy a subscription

    As a user
    In order to get access to the best articles
    I would like to be able to buy a subscription

    Background:
        Given the following user exists
            | first_name | last_name | email         | password | role       | id |
            | Hanna      | Nyman     | hanna@tuna.se | password | journalist | 1  |

    Scenario: User can successfully buy a subscription
        And I am logged in as 'hanna@tuna.se'
        And I click 'Buy subscription'
        And I fill in the payment form
        And I click 'Pay'
        Then I wait 2 seconds
        Then I should see 'You have become a subscriber!'