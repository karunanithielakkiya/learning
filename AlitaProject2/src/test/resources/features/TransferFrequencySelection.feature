Feature: Transfer Frequency Selection
   In order to manage my transfers effectively
   As a user of the system
   I want to select the appropriate transfer frequency option

Background:
   Given I am logged into the system

Scenario: Verify Transfer Frequency Selection Screen
   When I navigate to the transfer section
   Then I should see the transfer frequency selection screen

Scenario: Verify One-Time Transfer Option
   When I am on the transfer frequency selection screen
   And I view the available transfer frequency options
   Then I should see only the one-time transfer option

Scenario: Attempt to Select Recurring Transfer Option
   When I am on the transfer frequency selection screen
   And I attempt to select a recurring transfer option
   Then I should not be able to select it
   But I should receive a message indicating that recurring transfers are not available

Scenario: Confirm Selection of One-Time Transfer
   When I am on the transfer frequency selection screen
   And I select the one-time transfer option
   And I confirm the selection
   Then the one-time transfer option should be successfully selected and confirmed
   And I should receive a confirmation message