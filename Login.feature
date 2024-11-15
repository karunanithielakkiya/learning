Feature: Login Functionality for www.example.com

  @positive
  Scenario: Successful login with valid credentials
    Given the user is on the login page
    When the user enters a valid username "validUser" and password "validPass"
    And clicks the login button
    Then the user should be redirected to the dashboard page
    And the dashboard should display personalized content

  @negative
  Scenario Outline: Unsuccessful login with invalid credentials
    Given the user is on the login page
    When the user enters an invalid username "<username>" or password "<password>"
    And clicks the login button
    Then an error message should be displayed
    And the error message should read "Invalid username or password."

    Examples:
      | username   | password   |
      | invalidUser| validPass  |
      | validUser  | invalidPass|
      | invalidUser| invalidPass|

  @negative
  Scenario: Password does not meet complexity requirements
    Given the user is on the login page
    When the user enters a username "validUser" and a password "simple"
    And clicks the login button
    Then an error message should be displayed
    And the error message should indicate the password requirements

  @negative
  Scenario: Required fields are empty
    Given the user is on the login page
    When the user leaves the username or password field empty
    And clicks the login button
    Then an error message should be displayed
    And the error message should indicate that both fields are required

  @negative
  Scenario: Exceeding login attempt limit
    Given the user is on the login page
    When the user enters invalid credentials 5 times
    Then the user should be temporarily locked out
    And a message should read "Too many failed login attempts. Please try again after 30 minutes."