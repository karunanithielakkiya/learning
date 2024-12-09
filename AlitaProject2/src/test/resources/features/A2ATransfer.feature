Feature: A2A Transfer Functionality
   In order to accurately specify the accounts involved in a transaction
   As a branch user
   I want to input both the FROM and TO account details to initiate an A2A transfer

Background:
   Given the user is logged into the branch application
   And the user is on the A2A transfer page

Scenario: Successful A2A Transfer with Valid Account Details
   When the user enters valid FROM account details "123456789" 
   And the user enters valid TO account details "987654321"
   And the user initiates the transfer
   Then the system should validate the account details
   And the transfer should be initiated successfully
   And a confirmation message "Transfer initiated successfully" should be displayed

Scenario Outline: A2A Transfer with Invalid Account Details
   When the user enters FROM account details "<from_account>"
   And the user enters TO account details "<to_account>"
   And the user initiates the transfer
   Then the system should validate the account details
   But an error message "<error_message>" should be displayed
   And the transfer should not be initiated

Examples:
   | from_account | to_account   | error_message                      |
   | 123          | 987654321    | "Invalid FROM account details"     |
   | 123456789    | 987          | "Invalid TO account details"       |
   | 123          | 987          | "Invalid FROM and TO account details" |

Scenario: A2A Transfer Page Compatibility
   When the user tests the A2A transfer functionality on different browsers and devices
   Then the A2A transfer functionality should work consistently across platforms
