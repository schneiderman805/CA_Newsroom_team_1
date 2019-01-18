Feature: Editor can manage articles

    As an Editor,
    In order to manage the articles of my news-site
    I would like be able to review, publish edit or delete

    Background:
        Given the following categories exists
            | name     | id |
            | Sports   | 1  |
            | Politics | 2  |
        And the following user exists
            | first_name | last_name    | email          | password | role       | id |
            | Hanna      | Nyman        | hanna@tuna.se  | password | editor     | 1  |
            | William    | Schneiderman | will@gmail.com | password | journalist | 2  |
            | Adi        | Naik         | adi@gmail.com  | password | journalist | 3  |


        And the following articles exists
            | title                | lede  | body                         | category_id | user_id | published |
            | A breaking news item | Lede1 | hello this is about me       | 1           | 2       | false     |
            | Learn Rails 5        | Lede2 | hello this is about that guy | 2           | 3       | false     |

        And I am logged in as "hanna@tuna.se"
        And I click "My account"

    Scenario: Editor can see all articles
        Then I should see "A breaking news item"
        And I should see "Lede1"
        And I should see "Learn Rails 5"
        And I should see "Lede2"

    Scenario: Editor can edit an article
        When I click "Edit" for "A breaking news item"
        And I fill in "Title" with "Greg is coding god!"
        And I fill in "Lede" with "This is the lede paragraph"
        And I select "Politics" from "Category"
        And I click "Update Article"
        Then I should see "Greg is coding god!"
        And I should see "This is the lede paragraph"
        And I should see "Politics"

    @javascript
    Scenario: Successfully delete an article
        When I click "Delete" for "A breaking news item"
        And I click to accept the alert message
        Then I should not see "A breaking news item"

    Scenario: Editor can publish articles
        When I click "Show" for "A breaking news item"
        And I click "Publish Article"
        Then I should see "Published" in "A breaking news item"