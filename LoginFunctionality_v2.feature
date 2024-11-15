Feature: User Authentication on Login Page

  Background:
    Given the user is on the login page of "www.example.com"

  @validLogin
  Scenario Outline: Successful login with valid credentials
    Given the user enters a valid username "<username>"
    And the user enters a valid password "<password>"
    When the user clicks the login button
    Then the user should be redirected to the dashboard page
    And the dashboard should display personalized content

    Examples:
      | username     | password         |
      | validUser1   | ValidPass1!      |
      | validUser2   | AnotherPass2@    |

  @invalidLogin
  Scenario Outline: Unsuccessful login with invalid credentials
    Given the user enters an invalid username "<username>"
    And the user enters an invalid password "<password>"
    When the user clicks the login button
    Then an error message should be displayed
    And the error message should read "Invalid username or password."

    Examples:
      | username     | password         |
      | invalidUser1 | wrongPass1       |
      | validUser1   | wrongPass2       |
      | invalidUser2 | ValidPass1!      |

  @emptyFields
  Scenario: Attempt to login with empty fields
    Given the user leaves the username field empty
    And the user leaves the password field empty
    When the user clicks the login button
    Then an error message should be displayed
    And the error message should read "Both fields are required."

  @passwordValidation
  Scenario Outline: Password validation rules
    Given the user enters a valid username "validUser1"
    And the user enters a password "<password>"
    When the user clicks the login button
    Then an error message should be displayed
    And the error message should read "Invalid username or password."

    Examples:
      | password      |
      | short1!       |
      | noUppercase1! |
      | NOLOWERCASE1! |
      | NoNumber!     |
      | NoSpecialChar1|

  @loginAttemptLimit
  Scenario: Exceeding login attempt limit
    Given the user enters an invalid username "invalidUser1"
    And the user enters an invalid password "wrongPass1"
    When the user clicks the login button 5 times
    Then an error message should be displayed
    And the error message should read "Too many failed login attempts. Please try again after 30 minutes."