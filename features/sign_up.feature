Feature: Sign up
  In order to use the application
  As a guest
  I should be able to sign up


Background:
  Given I am a guest


Scenario: Successful sign up
  When I go to the registration page
    And I fill in my details
    And I click the Sign up button
  Then I should see this message "You have signed up successfully"
    And I should see "Books"


Scenario: Failing to sign up due to missing fields
  When I go to the registration page
    And I click the Sign up button
  Then I should see this message "Email can't be blank"
  And I should see this message "Password can't be blank"
  And I should see this message "Username can't be blank"
