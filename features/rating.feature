Feature: Sign up
  In order to edit rating
  As Admin I should
  supply new rating in edit form


Background:
  Given I am the following admin
    | Username   | Email           | Password    |
    | Ahmad      | ahmad@bookki.com| topsecret   |
    And I am logged out

  Given there are the following users
    | Username   | Email           | Password    |
    | Medo       | medo@bookki.com | medoo134    |
    | Mimi       | mimi@bookki.com | medoo134    |

  Given there are the following books
    | Title         | Isbn            |
    | the secret    | 1122334455667   |

  Given there are the following ratings
    | User               | Book            |stars|
    | medo@bookki.com    | 1122334455667   |2.0  |
    | mimi@bookki.com    | 1122334455667   |3.0  |

@javascript
Scenario: List ratings of each book
  When I go to the sign in page
    And I fill in Username with "Medo"
    And I fill in Password with "medoo134"
    And I click Sign in button
  Then I should see "Signed in successfully."
  And I should see "Books"
  And I should see "the secret"
  When I follow book number 1 in the list
  Then I should see "Rated by"
    And I should see "Medo"
    And I should see "Mimi"

# Scenario: Admin Edit Ratings
#   When I go to the sign in page
#     And I fill in Username with "Ahmad"
#     And I fill in Password with "topsecret"
#     And I click Sign in button
#   When I go to edit

