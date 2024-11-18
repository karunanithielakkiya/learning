Feature: User Login Functionality for www.example.com

  Background:
    Given the user is on the login page

  @positive
  Scenario Outline: Successful login with valid credentials
    Given the user enters a valid username "<username>"
    And the user enters a valid password "<password>"
    When the user clicks the login button
    Then the user should be redirected to the dashboard page
    And the dashboard should display personalized content

    Examples:
      | username   | password        |
      | user1      | ValidPass1!     |
      | user2      | AnotherPass2@   |

  @negative
  Scenario Outline: Login with invalid credentials
    Given the user enters an invalid username "<username>"
    And the user enters an invalid password "<password>"
    When the user clicks the login button
    Then an error message should be displayed
    And the error message should read "Invalid username or password."

    Examples:
      | username   | password        |
      | invalid1   | wrongPass1!     |
      | user1      | wrongPass2@     |
      | invalid2   | ValidPass1!     |

  @negative
  Scenario: Login with empty username and password fields
    Given the user leaves the username field empty
    And the user leaves the password field empty
    When the user clicks the login button
    Then an error message should be displayed
    And the error message should read "Both fields are required."

  @negative
  Scenario Outline: Password does not meet complexity requirements
    Given the user enters a valid username "<username>"
    And the user enters a password "<password>" that does not meet complexity requirements
    When the user clicks the login button
    Then an error message should be displayed
    And the error message should read "Invalid username or password."

    Examples:
      | username   | password   |
      | user1      | short1!    |
      | user2      | NoNumber!  |
      | user3      | nonumeric1 |

  @negative
  Scenario: Exceeding login attempt limit
    Given the user enters an invalid username "user1"
    And the user enters an invalid password "wrongPass1!"
    When the user attempts to login 5 times
    Then an error message should be displayed
    And the error message should read "Too many failed login attempts. Please try again after 30 minutes."