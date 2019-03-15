require "date"

require_relative "spec_helper.rb"

describe "Reservation class" do
  describe "Reservation instantiation" do
    let (:booking) {
      start_date = Date.today
      end_date = Date.today + 2
      booking = Hotel::Reservation.new(start_date, end_date, 1)
    }

    it "creates an instance of Reservation" do
      expect(booking).must_be_kind_of Hotel::Reservation
    end

    it "raises error for end_time before start_time" do
      start_date = Date.new(2019, 3, 15)
      end_date = Date.new(2019, 3, 14)
      expect {
        Hotel::Reservation.new(start_date, end_date, 1)
      }.must_raise ArgumentError
    end

    it "raises error for end_date same as start_date" do
      start_date = Date.new(2019, 3, 15)
      expect {
        Hotel::Reservation.new(start_date, start_date, 1)
      }.must_raise ArgumentError
    end

    it "raises an error for invalid room number" do
      expect {
        Hotel::Reservation.new(Date.today, Date.today + 2, 30).must_raise ArgumentError
      }
    end
  end

  describe "Reservation total cost" do
    it "returns correct number of days" do
      start_date = Date.new(2030, 3, 4)
      end_date = start_date + 2
      range = Hotel::Reservation.new(start_date, end_date, 1)
      expect(range.total_nights).must_equal 2
    end

    it "returns the cost of a room" do
      start_date = Date.new(2019, 3, 15)
      end_date = Date.new(2019, 3, 16)
      booking = Hotel::Reservation.new(start_date, end_date, 1)
      expect(booking.total_cost).must_equal 200
    end
  end

  describe "Reservation in_date_range?" do
    let (:range) {
      start_date = Date.today
      end_date = start_date + 2
      range = Hotel::Reservation.new(start_date, end_date, 1)
    }

    it "returns true for dates within range" do
      expect(range.in_date_range?(Date.today)).must_equal true
    end

    it "returns false for dates outside range" do
      expect(range.in_date_range?(Date.today + 4)).must_equal false
    end

    it "returns false for invalid dates" do
      expect(range.in_date_range?("string")).must_equal false
    end
  end
end
