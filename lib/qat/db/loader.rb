require 'singleton'
require 'sequel'
require_relative 'version'

module QAT
  class DB
    # Database connections loader from Hash or configuration files.
    #@since 1.1.0
    class Loader
      include Singleton

      attr_reader :connections

      # Mandatory keys for database configurations
      #@since 1.1.0
      MANDATORY_KEYS = [:host, :database, :username, :password, :adapter]

      # Returns the QAT::DB::Loader connections storage
      #@param [Hash]
      #@since 1.1.0
      def initialize
        reset!
      end

      def reset!
        @connections = {}
      end

      class << self
        #@api private
        def method_missing(*args)
          self.instance.send(*args)
        end
      end
      # Loads databases connections from a YAML file
      #@param file_path [String] file containing browser drivers
      #@since 1.1.0
      def load_file(file_path)
        databases = YAML::load(::File.read(file_path)) || {}
        databases.each { |database, properties| load_db(database, properties) }
      end

      # Loads a database connection
      #@param database [String] database identifier
      #@param properties [Hash] database properties
      #@since 1.1.0
      def load_db(database, properties)
        connections.merge!({ database.to_sym => connection(properties) })
      end

      private
      # Returns a database connection
      #@return [Sequel::Database]
      #@since 1.1.0
      def connection(properties)
        config  = Hash[properties.map { |key, value| [key.to_sym, value] }]
        missing = MANDATORY_KEYS - config.keys
        raise InvalidConfigurationError.new "Missing mandatory configuration keys: '#{missing.join(', ')}'" unless missing.empty?
        Sequel.connect(properties)
      end
    end

    #Configuration load error class
    #@since 1.1.0
    class InvalidConfigurationError < StandardError
    end
  end
end