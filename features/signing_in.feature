 Feature: Signing in
          In order to use the site
          As a user
          I want to be able to sign in
      Scenario: Signing in via confirmation
      Given there are the following users:
        | email             | password | confirmed |
        | user@tickettracker.com | password | false |
      And "user@tickettracker.com" opens the email with subject "Confirmation instructions"
			And they click the first link in the email
			Then I should see "Your account was successfully confirmed" 
      When I sign in with email "user@tickettracker.com" and password "password"
      Then I should see "Signed in successfully."

      Scenario: Signing in via form
      Given there are the following users:
        | email             | password | confirmed |
        | user@tickettracker.com | password | true |
      And I am on the "Sign in" page
      When I sign in with email "user@tickettracker.com" and password "password"
      Then I should see "Signed in successfully."