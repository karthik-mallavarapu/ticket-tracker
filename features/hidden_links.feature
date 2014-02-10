Feature: Hidden Links
In order to clean up the user experience
As the system
I want to hide links from users who can't act on them
Background:
  Given there are the following users:
    | email              | password | admin | confirmed |
    | user@tickettracker.com  | password | false | true |
    | admin@tickettracker.com | password | true  | true |
  And there is a project called "TextMate 2"
  Given I am on the homepage

Scenario: New project link is hidden for non-signed-in users
  Then I should not see the "New Project" link

Scenario: New project link is hidden for signed-in users
  When I follow "Sign in"  
  And I sign in with email "user@tickettracker.com" and password "password"
  Then I should not see the "New Project" link

Scenario: New project link is shown to admins
  When I follow "Sign in"  
  And I sign in with email "admin@tickettracker.com" and password "password"
  Then I should see the "New Project" link

  Scenario: Edit project link is hidden for signed-in users
  When I follow "Sign in"  
  And I sign in with email "user@tickettracker.com" and password "password"
  And I follow "TextMate 2"
  Then I should not see the "Edit Project" link

  Scenario: Edit project link is shown to admins
  When I follow "Sign in"  
  And I sign in with email "admin@tickettracker.com" and password "password"
  And I follow "TextMate 2"
  Then I should see the "Edit Project" link

    Scenario: Delete project link is hidden for signed-in users
  When I follow "Sign in"  
  And I sign in with email "user@tickettracker.com" and password "password"
  And I follow "TextMate 2"
  Then I should not see the "Delete Project" link

  Scenario: Delete project link is shown to admins
  When I follow "Sign in"  
  And I sign in with email "admin@tickettracker.com" and password "password"
  And I follow "TextMate 2"
  Then I should see the "Delete Project" link