require_relative "test_helper"

describe Hotel::Reservation do
  describe "cost" do
    it "returns a number" do
      start_date = Date.new(2017, 01, 01)
      end_date = start_date + 3
      room = 1
      reservation = Hotel::Reservation.new(start_date, end_date, room)
      expect(reservation.cost).must_be_kind_of Numeric
    end
    it "returns the total cost for the hotel" do 
      start_date = Date.new(2017, 01, 01)
      end_date = Date.new(2017, 01, 04)
      room = 1
      reservation = Hotel::Reservation.new(start_date, end_date, room)
      expect(reservation.cost).must_equal 600
    end 
  end
end