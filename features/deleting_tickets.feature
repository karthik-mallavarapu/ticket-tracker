Feature: Deleting tickets
          In order to remove tickets
          As a user
          I want to press a button and make them disappear
          Background:
            Given I am on the homepage
            And there are the following users:
              | email             | password | confirmed |
              | user@tickettracker.com | password | true |
            When I follow "Sign in"  
            And I sign in with email "user@tickettracker.com" and password "password"
            And there is a project called "TextMate 2"
            And "user@tickettracker.com" has created a ticket for this project:
              | title           | description                   |
              |  Make it shiny! | Gradients! Starbursts! Oh my! |
            Given I am on the homepage
            When I follow "TextMate 2"
            And I follow "Make it shiny!"
            
          Scenario: Deleting a ticket
            When I follow "Delete Ticket"
            Then I should see "Ticket has been deleted."
            And I should be on the project page for "TextMate 2"