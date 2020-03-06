require_relative 'test_helper'

describe "reservation tests" do
  before do
    @reservation = Hotel::Reservation.new(3, Date.new(2020, 5, 20), Date.new(2020, 10, 20))
  end

  describe "initialize" do
    it "can be instantiated" do
      expect(@reservation).must_be_instance_of Hotel::Reservation
    end

    it "will calculate the cost of the stay" do
      expect(@reservation.cost).must_equal 1000
    end

    it "will store the start and end dates of the reservation" do
      expect(@reservation.stay_begin).must_equal Date.new(2020, 5, 20)
      expect(@reservation.stay_end).must_equal Date.new(2020, 10, 20)
    end

  end
end