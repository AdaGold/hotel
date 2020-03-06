require "simplecov"
SimpleCov.start

require_relative "test_helper"

describe "Reservation class" do
  it "calculate cost" do
    #Arrange
    date_range = DateRange.new("02-10-2020", "02-12-2020")
    reservation = Hotel::Reservation.new(date_range, 8)

    #Act
    cost = reservation.get_cost

    #Assert
    expect(cost).must_equal(date_range.duration * reservation.cost_per_night)
  end
end
