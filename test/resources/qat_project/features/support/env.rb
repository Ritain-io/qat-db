require 'minitest'
require 'qat/cucumber'
require 'qat/db/auto_load'

# Code coverage
require 'simplecov'

module Test
  include QAT::Logger
  include Minitest::Assertions

  attr_writer :assertions

  def assertions
    @assertions ||= 0
  end
end
World(Test)