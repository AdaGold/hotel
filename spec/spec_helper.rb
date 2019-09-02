# Add simplecov
require "minitest"
require "minitest/autorun"
require "minitest/reporters"
require "minitest/skip_dsl"

require "date"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# Require_relative your lib files here!
require_relative "../lib/hotel_controller.rb"
require_relative "../lib/reservation.rb"
require_relative "../lib/date_range.rb"
