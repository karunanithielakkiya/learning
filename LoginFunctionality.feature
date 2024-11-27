Feature: User Login Functionality
  As a user of the application
  I want to be able to log in with valid credentials
  So that I can access my personalized dashboard

  @positive
  Scenario: Successful login with valid credentials
    Given the user is on the login page at "http://www.saucedemo.com"
    When the user enters a valid username "standard_user"
    And the user enters a valid password "ValidPass1!"
    And the user clicks the login button
    Then the user should be redirected to the dashboard page
    And the dashboard should display personalized content

  @negative
  Scenario Outline: Login with invalid credentials
    Given the user is on the login page at "http://www.saucedemo.com"
    When the user enters an invalid username "<username>"
    And the user enters an invalid password "<password>"
    And the user clicks the login button
    Then an error message should be displayed with text "Invalid username or password."

    Examples:
      | username       | password     |
      | invalid_user   | ValidPass1!  |
      | standard_user  | wrongPass1!  |
      | invalid_user   | wrongPass1!  |

  @negative
  Scenario: Login with empty username and password fields
    Given the user is on the login page at "http://www.saucedemo.com"
    When the user leaves the username field empty
    And the user leaves the password field empty
    And the user clicks the login button
    Then an error message should be displayed indicating that both fields are required

  @negative
  Scenario: Login with password not meeting complexity requirements
    Given the user is on the login page at "http://www.saucedemo.com"
    When the user enters a valid username "standard_user"
    And the user enters a password "short1!"
    And the user clicks the login button
    Then an error message should be displayed with text "Invalid username or password."

  @negative
  Scenario: Exceeding login attempt limit
    Given the user is on the login page at "http://www.saucedemo.com"
    When the user enters an invalid username "standard_user"
    And the user enters an invalid password "wrongPass1!"
    And the user clicks the login button
    And the user repeats the login attempt 5 times
    Then an error message should be displayed with text "Too many failed login attempts. Please try again after 30 minutes."