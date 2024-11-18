Feature: User Login Functionality

  Background:
    Given the user is on the login page of "www.example.com"

  @positive
  Scenario Outline: Successful login with valid credentials
    Given the user enters a valid username "<username>"
    And the user enters a valid password "<password>"
    When the user clicks the login button
    Then the user should be redirected to the dashboard page
    And the dashboard should display personalized content

    Examples:
      | username     | password       |
      | validUser1   | ValidPass1!    |
      | validUser2   | ValidPass2@    |

  @negative
  Scenario Outline: Login with invalid credentials
    Given the user enters an invalid username "<username>"
    And the user enters an invalid password "<password>"
    When the user clicks the login button
    Then an error message should be displayed
    And the error message should read "Invalid username or password."

    Examples:
      | username     | password       |
      | invalidUser1 | InvalidPass1   |
      | validUser1   | InvalidPass2   |
      | invalidUser2 | ValidPass1!    |

  @negative
  Scenario: Login with empty username and password fields
    Given the user leaves the username field empty
    And the user leaves the password field empty
    When the user clicks the login button
    Then an error message should be displayed
    And the error message should read "Both fields are required."

  @negative
  Scenario Outline: Password validation rules
    Given the user enters a valid username "<username>"
    And the user enters a password "<password>"
    When the user clicks the login button
    Then an error message should be displayed
    And the error message should read "Invalid username or password."

    Examples:
      | username   | password    |
      | validUser1 | short1!     | # Less than 8 characters
      | validUser1 | NoNumber!   | # No numeric character
      | validUser1 | nonumber1   | # No uppercase character
      | validUser1 | NONUMBER1!  | # No lowercase character
      | validUser1 | NoSpecial1  | # No special character

  @negative
  Scenario: Exceeding login attempt limit
    Given the user enters an invalid username "invalidUser"
    And the user enters an invalid password "InvalidPass"
    When the user clicks the login button 5 times
    Then an error message should be displayed
    And the error message should read "Too many failed login attempts. Please try again after 30 minutes."