require_relative "spec_helper"

describe Hotel::Reservation do
  describe "cost" do
    it "returns the correct cost" do
      start_date = Date.new(2017, 01, 01)
      end_date = start_date + 3
      reservation = Hotel::Reservation.new(start_date, end_date, nil)
      expect(reservation.cost).must_equal 600
    end
  end
end
