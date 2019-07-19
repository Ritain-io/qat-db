require 'minitest'
require 'aruba/cucumber'
require 'qat/cucumber'
require 'qat/logger'
require 'qat/db'
# Code coverage
require 'simplecov'

Aruba.configure do |config|
  config.exit_timeout = 6000
end