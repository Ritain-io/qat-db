require 'qat/logger'
require_relative 'version'
require_relative 'loader'

module QAT
  class DB
    module AutoLoad
      include QAT::Logger

      def self.load_databases!
        if QAT.respond_to?(:configuration) && QAT.configuration[:databases]
          QAT.configuration[:databases].each { |name, db| QAT::DB::Loader.load_db(name, db) }
          log.debug { "Database connections loaded in cache: [#{QAT::DB::Loader.connections.keys.join(', ')}]" }
        else
          log.debug { "Databases aren't loaded in cache, load databases manually from file using QAT::DB::Loader#load_file" }
        end
      end
    end
  end
end

QAT::DB::AutoLoad.load_databases!