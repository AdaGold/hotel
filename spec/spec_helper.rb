# hotel_spec.rb

# Add simplecov
require "minitest"
require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

require_relative "../lib/hotel.rb"

describe Room do
  it "should have access to the room number that is an integer" do
    # arrange
    number = 123

    # act
    room = Room.new(number)

    # assert
    expect(room.number).must_be_instance_of Integer
  end
end
