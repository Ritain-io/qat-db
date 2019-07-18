@database
Feature: Dummy feature

  Scenario: Dummy scenario
    Then a list of database connections exist
    And the list of database connections include:
      | connections |
      | postgres    |
      | oracle      |

