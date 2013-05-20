Feature: Sign up
  In order to use the application
  As a registered user
  I should be able to sign in


Background:
  Given I am the following user
    | Username   | Email           | Password    |
    | Ahmad      | ahmad@bookki.com| topsecret   |
    And I am logged out


Scenario: Successful login
  When I go to the sign in page
    And I fill in Username with "Ahmad"
    And I fill in Password with "topsecret"
    And I click Sign in button
  Then I should see this message "Signed in successfully."
  When I go to the sign out page
    Then I should see this message "You need to sign in or sign up before continuing."

Scenario: Failing to log in due to being not registered
  When I go to the sign in page
    And I fill in Username with "Medo"
    And I fill in Password with "secret"
    And I click Sign in button
  Then I should see this message "Invalid email or password."
