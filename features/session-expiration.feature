Feature: Session expiration
  In order to ensure that people are notified when their session has expired
  As a backend user
  A modal dialog window must be shown which prevents user from performing other actions.

  Scenario: Switching sections when session has already expired
    When I login as "admin" with password "BehatTest1"
    Then I am successfully authenticated
    And I am on a dashboard section
    And it is programatically emulated that my session is expired
    But now when I try to switch a section to "Tools"
    Then a session expired notification modal window must be presented to a user
    Given I click on Close button in the session expired notification window
    Then window is no longer displayed
    And now when I try to switch a section to "Tools"
    Then a session expired notification modal window must be presented to a user
    Given I click on Login button in the window
    Then the a page must be reloaded and initial login page must be displayed
