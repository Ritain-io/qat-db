# -*- encoding : utf-8 -*-
require_relative 'db/version'
require 'sequel'
require_relative '../sequel/core_ext/query'
require 'qat/logger'
require_relative 'db/loader'
require_relative 'db/operations'

module QAT
  class DB
    include QAT::Logger
    include Operations

    attr_reader :args

    # New QAT::DB
    def initialize(*args, &block)
      @args = args
    end

    class << self
      # Proxy to database connection stored in QAT::DB::Loader
      #@param db [String] database identifier
      #@return [Sequel::Database]
      def method_missing(db)
        Loader.connections.fetch(db.to_sym)
      end
    end
  end
end
