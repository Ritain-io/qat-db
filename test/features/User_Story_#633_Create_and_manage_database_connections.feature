@user_story#633
Feature: User Story #633: Create and manage database connections
  In order to do data validations in databases
  as a test developer,
  I want have an interface to create and manage database connections

  @test#1
  Scenario: Create a database connection from a Hash with all parameters
    Given I have connection info for database "postgres":
    """
    {
      host: 'locahost',
      port: 5433,
      database: 'test',
      username: 'test',
      password: 't3st',
      adapter: 'postgres'
    }
    """
    When I load the connection information
    Then a Sequel database connection for "postgres" exists in the connections list

  @test#2
  Scenario: Create a database connection from a Hash missing port parameter
    Given I have connection info for database "postgres":
    """
    {
      host: 'localhost',
      port: 5433,
      database: 'test',
      username: 'test',
      password: 't3st',
      adapter: 'postgres'
    }
    """
    When I load the connection information
    Then a Sequel database connection for "postgres" exists in the connections list

  @test#3
  Scenario: Create a database connection from a Hash missing database parameter
    Given I have connection info for database "postgres":
    """
    {
      host: 'localhost',
      port: 5433,
      username: 'test',
      password: 't3st',
      adapter: 'postgres'
    }
    """
    When I load the connection information
    Then a "QAT::DB::InvalidConfigurationError" exception is raised


  @test#4
  Scenario: Create a database connection from a Hash missing username parameter
    Given I have connection info for database "postgres":
    """
    {
      host: 'localhost',
      port: 5433,
      database: 'test',
      password: 't3st',
      adapter: 'postgres'
    }
    """
    When I load the connection information
    Then a "QAT::DB::InvalidConfigurationError" exception is raised


  @test#5
  Scenario: Create a database connection from a Hash missing password parameter
    Given I have connection info for database "postgres":
    """
    {
      host: 'lolcahost',
      port: 5433,
      database: 'test',
      username: 'test',
      adapter: 'postgres'
    }
    """
    When I load the connection information
    Then a "QAT::DB::InvalidConfigurationError" exception is raised


  @test#6
  Scenario: Create a database connection from a Hash missing adapter parameter
    Given I have connection info for database "postgres":
    """
    {
      host: 'localhost',
      port: 5433,
      database: 'test',
      username: 'test',
      password: 't3st',
    }
    """
    When I load the connection information
    Then a "QAT::DB::InvalidConfigurationError" exception is raised


  @test#7
  Scenario: Create a database connection from a YAML file
    Given I have a databases YAML file with content:
    """
    postgres:
      host: 'localhost'
      port: 5433
      database: 'test'
      username: 'test'
      password: 't3st'
      adapter: 'postgres'
    """
    When I load database connections from the databases file
    Then a Sequel database connection for "postgres" exists in the connections list


  @test#8
  Scenario: Create various database connections from a YAML file
    Given I have a databases YAML file with content:
    """
    postgres:
      host: 'localhost'
      port: 5433
      database: 'test'
      username: 'test'
      password: 't3st'
      adapter: 'postgres'
    oracle:
      host: 'localhost'
      port: 1522
      database: 'xe'
      username: 'system'
      password: 'oracle'
      adapter: 'oracle'
    """
    When I load database connections from the databases file
    Then the Sequel database connections exists in the connections list:
      | connection |
      | postgres   |
      | oracle     |


  @announce @test#9
  Scenario: Auto-load databases connections fails in non QAT projects
    Given I copy the directory named "../../resources/project" to "project"
    And I cd to "project"
    When I run `bundle exec rake test`
    Then the output should match:
    """
    QAT::DB::AutoLoad: Databases aren't loaded in cache, load databases manually from file using QAT::DB::Loader#load_file
    """
    And the exit status should be 0


  @announce @test#10
  Scenario: Auto-load databases connections succeeds in QAT projects
    Given I copy the directory named "../../resources/qat_project" to "project"
    And I cd to "project"
    When I run `bundle exec rake test`
    Then the output should match:
    """
    QAT::DB::AutoLoad: Database connections loaded in cache: \[postgres, oracle\]
    """
    And the exit status should be 0