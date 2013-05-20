Feature: Sign up
  In order rate a book
  As a registered user
  I should be able to add it and star it

Background:
Given I am the following user
  | Username   | Email           | Password    |
  | Ahmad      | ahmad@bookki.com| topsecret   |
@javascript
Scenario: Successful Rating
  When I go to the sign in page
    And I fill in Username with "Ahmad"
    And I fill in Password with "topsecret"
    And I click Sign in button
  Then I should be on home page
  When I click New link within main content area
    And I fill in Title with "7 habits of higly effective people"
    And I fill in Isbn with "1122334455667"
    And I click Create Book button
  Then I should see this message "Book was successfully created."
    And I should see "7 habits of higly effective people"
    And I should see "1122334455667"
    And I should see "Book was successfully created."
    And I should be able rate 4 stars link within main content area