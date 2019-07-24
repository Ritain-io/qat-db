@user_story#648
Feature: User Story #648: Oracle database support

  Background:
    Given I have a connection "oracle" with info:
    """
    {
      host: 'localhost',
      port: 1522,
      database: 'xe',
      username: 'system',
      password: 'oracle',
      adapter: 'oracle'
    }
    """

  @test#12
  Scenario: Execute random query
    When I execute query:
    """
    select * from dual
    """
    Then the query returns values:
      | dummy |
      | "X"   |
