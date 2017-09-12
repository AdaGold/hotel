require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/reporters'


require 'simplecov'
SimpleCov.start

#require any classes
require_relative '../lib/hotel'
require_relative '../lib/reservation'
require_relative '../lib/date_range'



Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new