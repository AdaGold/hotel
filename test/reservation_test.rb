require_relative "test_helper"

describe Hotel::Reservation do
  before do 
    start_date = Date.new(2017, 01, 01)
    end_date = start_date + 3
    @date_range = Hotel::DateRange.new(start_date, end_date)
    @room = 1
    @reservation = Hotel::Reservation.new(@date_range, @room)
  end 

  describe "cost" do
    it "returns a number" do
      expect(@reservation.cost).must_be_kind_of Numeric
    end
    it "returns the total cost for the hotel" do 
      expect(@reservation.cost).must_equal 600
    end 
  end
end