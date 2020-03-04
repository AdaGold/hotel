# Add simplecov
require "minitest"
require "minitest/autorun"
require "minitest/reporters"
require "simplecov"

SimpleCov.start do
  add_filter 'test/'
end

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# require_relative your lib files here!
require_relative '../lib/date_range'
require_relative '../lib/hotel_controller'
require_relative '../lib/reservation'
