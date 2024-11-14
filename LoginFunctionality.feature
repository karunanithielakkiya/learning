Feature: User Authentication on Login Page

  Background:
    Given the user is on the login page of "www.example.com"

  @validLogin
  Scenario: Successful login with valid credentials
    Given the user enters a valid username "validUser"
    And the user enters a valid password "ValidPass123!"
    When the user clicks the login button
    Then the user should be redirected to the dashboard page
    And the dashboard should display personalized content

  @invalidLogin
  Scenario Outline: Unsuccessful login with invalid credentials
    Given the user enters an invalid username "<username>"
    And the user enters an invalid password "<password>"
    When the user clicks the login button
    Then an error message should be displayed
    And the error message should read "Invalid username or password."

    Examples:
      | username   | password       |
      | invalidUser| ValidPass123!  |
      | validUser  | invalidPass    |
      | invalidUser| invalidPass    |

  @emptyFields
  Scenario: Attempt to login with empty required fields
    Given the user leaves the username field empty
    And the user leaves the password field empty
    When the user clicks the login button
    Then an error message should be displayed
    And the error message should read "Both fields are required."

  @passwordValidation
  Scenario Outline: Password validation rules
    Given the user enters a valid username "validUser"
    And the user enters a password "<password>"
    When the user clicks the login button
    Then an error message should be displayed
    And the error message should read "Invalid username or password."

    Examples:
      | password       |
      | short1!        |
      | NoNumber!      |
      | nonumeric123   |
      | NOLOWERCASE1!  |
      | nouppercase1!  |
      | NoSpecialChar1 |

  @loginAttemptLimit
  Scenario: Lockout after too many failed login attempts
    Given the user enters an invalid username "invalidUser"
    And the user enters an invalid password "invalidPass"
    When the user clicks the login button 5 times
    Then a lockout message should be displayed
    And the message should read "Too many failed login attempts. Please try again after 30 minutes."