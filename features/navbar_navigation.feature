Feature: Use Navbar to navigate through the site
  
  As a user
  In order to quickly navigate the site
  I would like to see a navbar with appropriate links.

    Scenario: Navigate through links in Navbar
      When I visit the site
      Then I should see Navbar
      And I should see 'Log in'
      And I click 'Sign up'
      Then I am on Sign up page