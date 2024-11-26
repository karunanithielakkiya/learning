Feature: Login functionality for SauceDemo application

  @positive
  Scenario: Successful login with valid credentials
    Given the user is on the SauceDemo login page
    When the user enters a valid username "standard_user" and a valid password "secret_sauce"
    And the user clicks on the Login button
    Then the user should be redirected to the home page/dashboard

  @negative
  Scenario: Login attempt with missing username
    Given the user is on the SauceDemo login page
    When the user leaves the username field empty
    And the user enters a valid password "secret_sauce"
    And the user clicks on the Login button
    Then the user should see an error message "Epic sadface: Username is required"

  @negative
  Scenario: Login attempt with missing password
    Given the user is on the SauceDemo login page
    When the user enters a valid username "standard_user"
    And the user leaves the password field empty
    And the user clicks on the Login button
    Then the user should see an error message "Epic sadface: Password is required"

  @negative
  Scenario: Login attempt with both fields empty
    Given the user is on the SauceDemo login page
    When the user leaves the username field empty
    And the user leaves the password field empty
    And the user clicks on the Login button
    Then the user should see an error message "Epic sadface: Username is required"

  @negative
  Scenario: Login attempt with invalid credentials
    Given the user is on the SauceDemo login page
    When the user enters an invalid username "invalid_user" and an invalid password "wrong_password"
    And the user clicks on the Login button
    Then the user should see an error message "Epic sadface: Username is required"

  @boundary
  Scenario Outline: Boundary testing for username and password fields
    Given the user is on the SauceDemo login page
    When the user enters a username "<username>"
    And the user enters a password "<password>"
    And the user clicks on the Login button
    Then the user should see an error message "<error_message>"

    Examples:
      | username       | password       | error_message                          |
      | ""             | "secret_sauce" | Epic sadface: Username is required     |
      | "standard_user"| ""             | Epic sadface: Password is required     |
      | ""             | ""             | Epic sadface: Username is required     |
