Feature: Managing translations
  In order to manage translations
  As a backend user
  I use "Translation tools" section in Tools / Translations section

  Background:
    When I login as "admin" with password "1234"
    Then I am successfully authenticated
    And I navigate to "Tools"
    And I click on "Translations" in Tools view
    Then view "translationTokensGrid" is visible
    When I click "button" named "importBtn"
    Then grid "translationTokensGrid" must contain at least 5 rows

  Scenario: Making sure that translations sorting works
    When I click header "Bundle name" in a grid "translationTokensGrid"
    Then in grid "translationTokensGrid" row with position 0 column "Bundle name" must be equal to "ModeraBackendSecurityBundle"
    Then in grid "translationTokensGrid" row with position 0 column "Token name" must be equal to "Security permissions"
    When I click header "Bundle name" in a grid "translationTokensGrid"
    Then in grid "translationTokensGrid" row with position 0 column "Bundle name" must be equal to "ModeraDynamicallyConfigurableAppBundle"
    When I click header "Token name" in a grid "translationTokensGrid"
    Then in grid "translationTokensGrid" row with position 0 column "Token name" must be equal to "Access Users Manager"
    When I click header "Token name" in a grid "translationTokensGrid"
    Then in grid "translationTokensGrid" row with position 0 column "Token name" must be equal to "yes"
    When I click header "English" in a grid "translationTokensGrid"
    Then in grid "translationTokensGrid" row with position 0 column "Token name" must be equal to "yes"
    When I click header "English" in a grid "translationTokensGrid"
    Then in grid "translationTokensGrid" row with position 0 column "Token name" must be equal to "Modera.backend.tools.activitylog.view.MainPanel.userLabel"
    # TODO: sorting by other languages than "English" doesn't work, MPFE-989

  Scenario: Grid filtering
    When I type text "import" in field "filterInput"
    And I wait for 2 seconds
    Then grid "translationTokensGrid" must contain 1 rows
    Then in grid "translationTokensGrid" row with position 0 column "Token name" must be equal to "Modera.backend.translationstool.toolscontribution.view.List.importBtn"
    When I clear text in a field "filterInput"
    Then I wait for 2 seconds
    Then grid "translationTokensGrid" must contain at least 5 rows

  Scenario: Changing translation token
    When I type text "Translations" in field "filterInput"
    And I wait for 2 seconds
    Then grid "translationTokensGrid" must contain 2 rows
    When in grid "translationTokensGrid" I double-click column "English" at position 0
    And I wait for 2 seconds
    Then window "translationTokenEditWindow" is visible
    When I clear text in a field "translationInput"
    And I type text "Yo translations, man!" in field "translationInput"
    And I click button named "saveandclosebtn"
    And I click button named "compileBtn"
    And I wait for 5 seconds
    And I refresh the page
    And grid "translationTokensGrid" is visible
    Then I see a piece of text "Yo translations, man!"
    # Rolling back the state:
    When in grid "translationTokensGrid" I double-click column "English" at position 0
    And I wait for 2 seconds
    Then window "translationTokenEditWindow" is visible
    When I clear text in a field "translationInput"
    And I type text "Translations" in field "translationInput"
    And I click button named "saveandclosebtn"
    And I click button named "compileBtn"
    And I wait for 5 seconds

  Scenario: Deleting translation tokens
    And I type text "production" in field "filterInput"
    When in a grid "translationTokensGrid" I click a cell whose column "Token name" value is "Production mode"
    And I click button named "deleteTranslationToken"
    And I wait for 3 seconds
    Then in grid "translationTokensGrid" there must be no row whose column "Token name" value is "Production mode"


