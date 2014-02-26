Feature: Deleting tickets

In order to remove tickets
As a user
I want to press a button and make them disappear

Background:
  Given there are the following users:
  | email             | password | confirmed | admin |
  | user@tickettracker.com | password | true | false |
  | admin@tickettracker.com | password | true | true |
  And there is a project called "TextMate 2"
  And "user@tickettracker.com" can view the "TextMate 2" project
  And "user@tickettracker.com" has created a ticket for this project:
  | title           | description                   |
  |  Make it shiny! | Gradients! Starbursts! Oh my! |

Scenario: Deleting a ticket
  Given "user@tickettracker.com" can "delete tickets" in the "TextMate 2" project
  And I am signed in as "user@tickettracker.com"
  And I am on the homepage
  When I follow "TextMate 2"
  And I follow "Make it shiny!"
  When I follow "Delete Ticket"
  Then I should see "Ticket has been deleted."
  And I should be on the project page for "TextMate 2"
