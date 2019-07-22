@user_story#647
Feature: User Story #647: PostgreSQL database support
  In order to validate data in Oracle databases
  as a tester,
  I want to have Oracle database support for executing queries

  Background:
    Given I have a connection "postgres" with info:
    """
    {
      host: 'localhost',
      port: 5433,
      database: 'qat_db',
      username: 'test',
      password: 't3st',
      adapter: 'postgres'
    }
    """

  @postgres_test_table @test#11
  Scenario: Execute random queries
    Given I create a test table using query:
    """
    CREATE TABLE test (
        code    integer,
        name    varchar(40)
    );
    """
    And I execute query:
    """
    INSERT INTO test VALUES (1, 'a row');
    """
    When I execute query:
    """
    SELECT * FROM test;
    """
    Then the query returns values:
      | code | name    |
      | 1    | "a row" |
