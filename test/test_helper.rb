require 'simplecov'
SimpleCov.start do
  add_filter 'test/' # Tests should not be checked for coverage.
end

require "minitest"
require "minitest/autorun"
require "minitest/skip_dsl"
# require "minitest/reporters"
require "date"
require "pry"


# Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# require_relative your lib files here!
require_relative '../lib/reservation.rb'
require_relative '../lib/room.rb'
require_relative '../lib/reservation_manager.rb'
require_relative '../lib/reservation_block.rb'
require_relative '../lib/csv_record.rb'