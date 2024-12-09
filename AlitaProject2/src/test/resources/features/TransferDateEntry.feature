Feature: Transfer Date Entry
  In order to schedule future transfers without errors
  As a branch or home office user
  I want to enter a transfer date up to 6 months from the current date

Background:
  Given the user is logged into the system

Scenario: Valid Transfer Date Selection
  When the user navigates to the transfer date selection screen
  And the user selects a date within 6 months from the current date
  Then the selected date is accepted
  And no error message is displayed

Scenario: Restrict Past Date Selection
  When the user navigates to the transfer date selection screen
  And the user attempts to select a past date
  Then the system displays an error message indicating that past dates cannot be selected

Scenario: Restrict Weekend Date Selection
  When the user navigates to the transfer date selection screen
  And the user attempts to select a weekend date
  Then the system displays an error message indicating that weekends cannot be selected

Scenario: Restrict Holiday Date Selection
  When the user navigates to the transfer date selection screen
  And the user attempts to select a holiday date
  Then the system displays an error message indicating that holidays cannot be selected