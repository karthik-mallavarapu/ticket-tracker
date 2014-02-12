Feature: Deleting users
         In order to remove users
         As an admin
         I want to click a button and delete them
         Background:
           Given there are the following users:
             | email              | password | admin | confirmed |
             | admin@tickettracker.com | password | true  | true |
             | user@tickettracker.com  | password | false | true |
           And I am signed in as "admin@tickettracker.com"
           Given I am on the homepage
           When I follow "Admin"
           And I follow "Users"

         Scenario: Deleting a user
           And I follow "user@tickettracker.com"
           And I follow "Delete User"
           Then I should see "User has been deleted"


         Scenario: Users cannot delete themselves
           And I follow "admin@tickettracker.com (Admin)"
           And I follow "Delete User"
           Then I should see "You cannot delete yourself!"