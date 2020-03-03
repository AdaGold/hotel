# Add simplecov
require "minitest"
require "minitest/autorun"
require "minitest/reporters"
require "minitest/skip_dsl"

require 'simplecov'
SimpleCov.start do
  add_filter 'test/' # Tests should not be checked for coverage.
end

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# require_relative your lib files here!

require_relative "../lib/hotel_controller.rb"
require_relative "../lib/reservation.rb"
require_relative "../lib/date_range.rb"


