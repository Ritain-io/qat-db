require_relative 'version'
require 'sequel'

# Database operations helper methods
module Operations
  # Returns the current connection
  #@return [Sequel::Database]
  def connection
    @connection
  end

  # Establishes a connection
  #@return [Sequel::Database]
  def connect(*args, &block)
    @connection = Sequel.connect(*args, &block)
    connection
  end

  # Executes a SQL statement in the open connection
  #@param sql [String] SQL statement to execute
  #@param opts [Hash] optional parameters
  #@see Sequel::Database#run
  #@return [NilClass]
  def execute(sql, opts=nil)
    args = [sql]
    args << opts if opts
    connection.run(*args)
  end

  # Executes a SQL query in the open connection and returns an array of results
  #@param sql [String] SQL query to execute
  #@return [Array]
  def query(sql)
    connection = Sequel.connect(self.args)
    connection[sql].map { |row| row }
    connection
    connection.close
  end

  # Connection Errors Exception
  class ConnectionError < StandardError
  end
end