require 'sequel'
#Override
module Sequel
  #Override
  class Database

    # Executes a SQL query in the open connection and returns an array of results
    #@param sql [String] SQL query to execute
    #@return [Array]
    def query(sql)
      self[sql].map { |row| row }
    end
  end
end