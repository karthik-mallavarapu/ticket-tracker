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
  And "user@tickettracker.com" can view the "TextMate 2" project
  And "user@tickettracker.com" has created a ticket for this project:
    | title  | description        |
    | Shiny! | My eyes! My eyes!  |

Scenario: New project link is hidden for signed-in users
  When I am signed in as "user@tickettracker.com"
  Then I should not see the "New Project" link

Scenario: New project link is shown to admins
  When I am signed in as "admin@tickettracker.com"
  Then I should see the "New Project" link

Scenario: Edit project link is hidden for signed-in users
  When I am signed in as "user@tickettracker.com"
  And I follow "TextMate 2"
  Then I should not see the "Edit Project" link

Scenario: Edit project link is shown to admins
  When I am signed in as "admin@tickettracker.com"
  And I follow "TextMate 2"
  Then I should see the "Edit Project" link

Scenario: Delete project link is hidden for signed-in users
  When I am signed in as "user@tickettracker.com"
  And I follow "TextMate 2"
  Then I should not see the "Delete Project" link

Scenario: Delete project link is shown to admins
  When I am signed in as "admin@tickettracker.com"
  And I follow "TextMate 2"
  Then I should see the "Delete Project" link

Scenario: New ticket link is shown to a user with permission
  Given "user@tickettracker.com" can "create tickets" in the "TextMate 2" project
  And I am signed in as "user@tickettracker.com"
  When I follow "TextMate 2"
  Then I should see "New Ticket"

Scenario: New ticket link is hidden from a user without permission
  Given I am signed in as "user@tickettracker.com"
  When I follow "TextMate 2"
  Then I should not see the "New Ticket" link

Scenario: New ticket link is shown to admins
  Given I am signed in as "admin@tickettracker.com"
  When I follow "TextMate 2"
  Then I should see the "New Ticket" link

  Scenario: Edit ticket link is shown to a user with permission
  Given "user@tickettracker.com" can "edit tickets" in the "TextMate 2" project
  And I am signed in as "user@tickettracker.com"
  When I follow "TextMate 2"
  And I follow "Shiny!"
  Then I should see the "Edit" link

Scenario: Edit ticket link is hidden from a user without permission
  Given I am signed in as "user@tickettracker.com"
  When I follow "TextMate 2"
  And I follow "Shiny!"
  Then I should not see the "Edit" link

Scenario: Edit ticket link is shown to admins
  Given I am signed in as "admin@tickettracker.com"
  When I follow "TextMate 2"
  And I follow "Shiny!"
  Then I should see the "Edit" link

