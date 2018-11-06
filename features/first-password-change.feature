Feature: Change initial password on first login
  In order to ensure that initial password will be changed
  A modal dialog window must be shown which prevents user from performing other actions.

  Scenario: Fill new password in change password dialog
    When I login as "admin" with password "1234"
    Then I am successfully authenticated
    Then window "changePasswordWindow" is visible
    When I click button named "saveandclosebtn"
    Then window "changePasswordWindow" should stay visible
    When I type text "BehatTest1" in field "passwordfield"
    And I type text "BehatTest1" in field "passwordagainfield"
    And I click button named "saveandclosebtn"
    And I wait for 5 seconds
    And I am on a dashboard section
