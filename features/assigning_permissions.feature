Feature: Assigning permissions

  In order to set up users with the correct permissions
  As an admin
  I want to check all the boxes

  Background:
    Given there are the following users:
      | email              | password | admin | confirmed |
      | admin@tickettracker.com | password | true  | true |
      | user@tickettracker.com | password | false | true |
    And there is a project called "TextMate 2"
    And I am signed in as "admin@tickettracker.com"
    When I follow "Admin"
    And I follow "Users"
    And I follow "user@tickettracker.com"
    And I follow "Permissions"
  
  Scenario: Viewing a project
    When I check "View Project" for "TextMate 2"
    And I press "Update"
    And I follow "Sign out"
    Given I am signed in as "user@tickettracker.com"
    Then I should see "TextMate 2"