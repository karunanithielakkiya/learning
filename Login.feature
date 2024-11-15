Feature: User Login Functionality for www.example.com

  @login
  Scenario Outline: Successful login with valid credentials
    Given the user is on the login page
    When the user enters a valid username "<username>" and a valid password "<password>"
    And clicks the login button
    Then the user should be redirected to the dashboard page
    And the dashboard should display personalized content

    Examples:
      | username   | password     |
      | user1      | ValidPass1!  |
      | user2      | ValidPass2@  |

  @login
  Scenario Outline: Unsuccessful login with invalid credentials
    Given the user is on the login page
    When the user enters an invalid username "<username>" or an invalid password "<password>"
    And clicks the login button
    Then an error message should be displayed
    And the message should read "Invalid username or password."

    Examples:
      | username   | password     |
      | invalid1   | ValidPass1!  |
      | user1      | invalidpass  |
      | invalid2   | invalidpass  |

  @login
  Scenario: Error message for empty username and password fields
    Given the user is on the login page
    When the user leaves the username and password fields empty
    And clicks the login button
    Then an error message should be displayed
    And the message should read "Both fields are required."

  @login
  Scenario: Error message for empty username field
    Given the user is on the login page
    When the user leaves the username field empty and enters a valid password "ValidPass1!"
    And clicks the login button
    Then an error message should be displayed
    And the message should read "Both fields are required."

  @login
  Scenario: Error message for empty password field
    Given the user is on the login page
    When the user enters a valid username "user1" and leaves the password field empty
    And clicks the login button
    Then an error message should be displayed
    And the message should read "Both fields are required."

  @login
  Scenario: Lockout after too many failed login attempts
    Given the user is on the login page
    When the user enters invalid credentials and clicks the login button 5 times
    Then an error message should be displayed
    And the message should read "Too many failed login attempts. Please try again after 30 minutes."