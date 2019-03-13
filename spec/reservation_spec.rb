require "date"

require_relative "spec_helper.rb"

describe "Reservation class" do
  describe "Reservation instantiation" do
    it "creates an instance of Reservation" do
      start_date = Date.new(2019, 3, 15)
      end_date = Date.new(2019, 3, 18)
      booking = Hotel::Reservation.new(start_date, end_date)
      expect(booking).must_be_kind_of Hotel::Reservation
    end

    it "raises error for end_time before start_time" do
      start_date = Date.new(2019, 3, 15)
      end_date = Date.new(2019, 3, 14)
      expect {
        Hotel::Reservation.new(start_date, end_date)
      }.must_raise ArgumentError
    end

    it "raises error for end_date same as start_date" do
      start_date = Date.new(2019, 3, 15)
      end_date = Date.new(2019, 3, 15)
      expect {
        Hotel::Reservation.new(start_date, end_date)
      }.must_raise ArgumentError
    end
  end

  describe "Reservation total cost" do
    it "returns correct number of days" do
      start_date = Date.new(2030, 3, 4)
      end_date = start_date + 2
      range = Hotel::Reservation.new(start_date, end_date)
      expect(range.total_nights).must_equal 2
    end

    it "returns the cost of a room" do
      start_date = Date.new(2019, 3, 15)
      end_date = Date.new(2019, 3, 16)
      booking = Hotel::Reservation.new(start_date, end_date)
      expect(booking.total_cost).must_equal 200
    end
  end
end
