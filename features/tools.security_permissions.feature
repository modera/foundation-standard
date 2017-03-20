Feature: Security permissions
  In order to manage security permissions, groups and users
  I use a section Tools / Security Permissions from /backend

  Scenario: Manging groups and users
    When I login as "admin" with password "1234"
    Then I am successfully authenticated
    When I navigate to "Tools"
    And I click on "Security permissions" in Tools view
    Then view "permissionsManagerPanel" is visible

    When I click button named "groupsSectionButton"
    And I wait for 1 seconds
    And I click button named "newGroupBtn"
    Then window "newAndEditGroupWindow" is visible
    When I click button named "saveandclosebtn"
    Then window "newAndEditGroupWindow" should stay visible
    When I type text "Backend users" in field "groupNameField"
    And I click button named "saveandclosebtn"
    Then grid "groupsListGrid" must contain a row with value "Backend users"
    When in grid "groupsListGrid" I click a row which contains "Backend users" piece of text
    And I click button named "editGroupBtn"
    Then view "newAndEditGroupWindow" is visible
    When I clear text in a field "groupNameField"
    And I type text "Administrators" in field "groupNameField"
    And I click button named "saveandclosebtn"
    And I wait for 1 seconds
    Then grid "groupsListGrid" must contain a row with value "Administrators"

    When I click button named "usersSectionButton"
    Then view "usersOverviewView" must be visible
    When I click button "newuserbtn"
    Then window "newUserWindow" must be shown
    And I click button "saveandclosebtn"
    Then window "newUserWindow" should stay visible
    When I type "John" in field "firstNameField"
    And I type text "Doe" in field "lastNameField"
    And I type text "john.doe" in field "usernameField"
    And I type text "john.doe@example.org" in field "emailField"
    And I click button named "saveandclosebtn"
    And I wait for 1 seconds
    Then grid "usersOverviewView" must contain a row with value "john.doe@example.org"
    When in grid "usersOverviewView" I click a row which contains "john.doe" piece of text
    And I click button "changepasswordbtn"
    Then window "changePasswordWindow" must be shown
    When I type text "1234" in field "passwordfield"
    And I type text "12345" in field "passwordagainfield"
    And I click button "saveandclosebtn"
    Then window "changePasswordWindow" should stay visible
    When I clear text in a field "passwordagainfield"
    And I type text "1234" in field "passwordagainfield"
    And I click button "saveandclosebtn"
    Then window "changePasswordWindow" must be closed

    When I click button "modifygroupsbtn"
    Then window "modifyGroupsMembershipWindow" must be shown
    When in grid "availablegroups" I click a row which contains "Administrators" piece of text
    And I click button "movetorightbtn"
    Then grid "assignedGroups" must contain a row with value "Administrators"
    When I click button "saveandclosebtn"
    Then window "modifyGroupsMembershipWindow" must be closed

    # John Doe
    When I authenticate as "john.doe" with password "1234"
    Then I see a piece of text "You don't have required rights to access administration interface."
    And I must not be authenticated

    # Admin
    When we switch back to "admin"
    And I click button "permissionsSectionButton"
    And I wait for 1 seconds
    Then view "permissionsOverviewView" must be shown
    When I refresh the page
    And I wait for 2 seconds
    And in grid "permissionsOverviewView" I click a column "Administrators" where one of the cells contain "Access Backend" piece of text
    And I wait for 2 seconds

    # John Doe
    When we switch back to "john.doe"
    And I authenticate as "john.doe" with password "1234"
    And I wait for 5 seconds
    Then I must be successfully authenticated

    # Admin
    # Cleaning up group
    When we switch back to "admin"
    And I click button named "groupsSectionButton"
    And I wait for 1 seconds
    And in grid "groupsListGrid" I click a row which contains "Administrators" piece of text
    And I expand menu for button "editGroupBtn"
    And I click "deleteGroupBtn"
    Then window "deleteConfirmationWindow" must be shown
    When I click "yesDeleteButton"
    And I wait for 3 seconds
    Then grid "groupsListGrid" must not contain a row with value "Administrators"

    # Cleaning up user
    And I click button named "usersSectionButton"
    And I wait for 2 seconds
    And in grid "usersOverviewView" I click a row which contains "john.doe@example.org" piece of text
    And I expand menu for button "editUserButton"
    And I click "deleteUserButton"
    Then window "deleteConfirmationWindow" must be shown
    When I click "yesDeleteButton"
    And I wait for 3 seconds
    Then grid "usersOverviewView" must not contain a row with value "john.doe@example.org"




