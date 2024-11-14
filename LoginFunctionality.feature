Feature: User Authentication on Login Page

  Background:
    Given the user is on the login page of "www.example.com"

  @valid-credentials
  Scenario: Successful login with valid credentials
    Given the user enters a valid username "validUser"
    And the user enters a valid password "ValidPass123!"
    When the user clicks the login button
    Then the user should be redirected to the dashboard page
    And the dashboard should display personalized content

  @invalid-credentials
  Scenario Outline: Unsuccessful login with invalid credentials
    Given the user enters an invalid username "<username>"
    And the user enters an invalid password "<password>"
    When the user clicks the login button
    Then an error message should be displayed: "Invalid username or password."

    Examples:
      | username   | password       |
      | invalidUser| ValidPass123!  |
      | validUser  | invalidPass    |
      | invalidUser| invalidPass    |

  @required-fields
  Scenario Outline: Attempt to login with missing required fields
    Given the user enters "<username>" in the username field
    And the user enters "<password>" in the password field
    When the user clicks the login button
    Then an error message should be displayed: "Both fields are required."

    Examples:
      | username | password |
      |          |          |
      | validUser|          |
      |          | ValidPass123! |

  @password-validation
  Scenario Outline: Password validation rules
    Given the user enters a valid username "validUser"
    And the user enters a password "<password>"
    When the user clicks the login button
    Then an error message should be displayed: "Invalid username or password."

    Examples:
      | password       |
      | short1!        |
      | NoSpecialChar1 |
      | noUppercase1!  |
      | NOLOWERCASE1!  |
      | NoNumber!      |

  @login-attempt-limit
  Scenario: Lockout after too many failed login attempts
    Given the user enters an invalid username "invalidUser"
    And the user enters an invalid password "invalidPass"
    When the user clicks the login button 5 times
    Then a message should be displayed: "Too many failed login attempts. Please try again after 30 minutes."