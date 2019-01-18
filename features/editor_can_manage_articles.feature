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
            | title                | lede  | body                         | category_id | user_id |
            | A breaking news item | Lede1 | hello this is about me       | 1           | 2       |
            | Learn Rails 5        | Lede2 | hello this is about that guy | 2           | 3       |

        And I am logged in as "hanna@tuna.se"
        And I click "All Articles"

    Scenario: Editor can see all articles
        Then I should see "A breaking news item"
        And I should see "Lede1"
        And I should see "Learn Rail 5"
        And I should see "Lede2"