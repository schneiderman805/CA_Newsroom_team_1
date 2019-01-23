[![Build Status](https://semaphoreci.com/api/v1/craftacademy/ca_newsroom_team_1/branches/pull-request-30/badge.svg)](https://semaphoreci.com/craftacademy/ca_newsroom_team_1)

[![Coverage Status](https://coveralls.io/repos/github/CraftAcademy/CA_Newsroom_team_1/badge.svg)](https://coveralls.io/github/CraftAcademy/CA_Newsroom_team_1)

# Crafty News

This is a simple news site built using Ruby on Rails framework. Users can create accounts, comment on articles, buy a subscription and can read news headlines from other sources depending on language they choose.

### Visit Craftynews [here](https://craftynews.herokuapp.com/)

# Features included:
* Visitors can change website language
* Visitors can view articles
* Visitors can register on the site
* Registered user can log in and log out
* Journalist (only) can create article
* Journalist can edit & delete their own articles
* User can comment on articles
* Journalist can add images to article 
* Visitor can choose between English and Swedish

# Contributors
(In Alphabetical order)

* [Aditya](https://github.com/kianaditya)
* [Camron](https://github.com/CamronLDNF)
* [Greg](https://github.com/GergKllai1)
* [Hanna](https://github.com/HannaSwDn)
* [Shahin](https://github.com/shahin1290)
* [William](https://github.com/schneiderman805)

# How to Use this code 
* `git clone https://github.com/CraftAcademy/CA_Newsroom_team_1` in your local projects folder
* `cd CA_Newsroom_team_1`
* `bundle install` to deploy all gems
* `yarn install` to install JS dependencies
* `rails db:setup` to create and seed the database using seeds file. 
* `rake` to run all unit and acceptance tests
* `rails s` to start rails server and to see the application running on `https://localhost:3000`

# Testing Frameworks
* [Rspec](http://rspec.info/) for unit testing
* [Cucumber](https://cucumber.io/) for acceptance testing

# Third party APIs used

* [Stripe](https://stripe.com/se)
* [News-api](https://newsapi.org/)