# spec_helper.rb

# to do: figure out Rake

# Add simplecov
require "minitest"
require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

require_relative "../lib/hotel.rb"

describe Reservation do
  it "should have access to the room number that is an integer" do
    # arrange
    number = 123

    # act
    reservation = Reservation.new(number)

    # assert
    expect(room.number).must_be_instance_of Integer
  end
end

describe HotelSystem do
  it "should have access to an array of room numbers" do
    #act
    marriott = HotelSystem.new()

    #assert
    expect(marriott.room_number).must_be_instance_of Array
    rray
  end
end

it "will raise an error when given an invalid date range" do
  #act
  marriott = HotelSystem.new()

  #assert
  expect {
    marriott.make_reservation(2019, 6, 30, 2019, 6, 8)
  }.must_raise ArgumentError

end
