Feature: Editing tickets
  In order to alter ticket information
  As a user
  I want a form to edit the tickets
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
           When I follow "Edit Ticket"

  Scenario: Updating a ticket
            When I fill in "Title" with "Make it really shiny!"
            And I press "Update Ticket"
            Then I should see "Ticket has been updated."
            And I should see "Make it really shiny!" within "#ticket h2"
            But I should not see "Make it shiny!"
  
  Scenario: Updating a ticket with invalid information
            When I fill in "Title" with ""
            And I press "Update Ticket"
            Then I should see "Ticket has not been updated."
