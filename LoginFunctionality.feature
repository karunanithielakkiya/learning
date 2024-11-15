Feature: User Login Functionality

  Background:
    Given the user is on the login page at "www.example.com"

  @positive
  Scenario Outline: Successful login with valid credentials
    Given the user enters a valid username "<username>"
    And the user enters a valid password "<password>"
    When the user clicks the login button
    Then the user should be redirected to the dashboard page
    And the dashboard should display personalized content

    Examples:
      | username   | password       |
      | user1      | ValidPass1!    |
      | user2      | AnotherPass2@  |

  @negative
  Scenario Outline: Login with invalid credentials
    Given the user enters an invalid username "<username>"
    Or the user enters an invalid password "<password>"
    When the user clicks the login button
    Then an error message should be displayed: "Invalid username or password."

    Examples:
      | username   | password       |
      | invalid1   | ValidPass1!    |
      | user1      | wrongPass      |
      | invalid2   | AnotherPass2@  |

  @negative
  Scenario: Login with empty required fields
    Given the user leaves the username field empty
    Or the user leaves the password field empty
    When the user clicks the login button
    Then an error message should be displayed: "Both fields are required."

  @negative
  Scenario: Password does not meet complexity requirements
    Given the user enters a valid username "user1"
    And the user enters a password "simple"
    When the user clicks the login button
    Then an error message should be displayed: "Invalid username or password."

  @negative
  Scenario: Exceeding login attempt limit
    Given the user enters an invalid username "user1"
    And the user enters an invalid password "wrongPass"
    When the user clicks the login button 5 times
    Then an error message should be displayed: "Too many failed login attempts. Please try again after 30 minutes."