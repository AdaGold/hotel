require_relative "test_helper"

describe "Hotel::Reservation" do
  describe "reservation" do
  it "can be initialized with two dates and room number" do
  #arrange
    start_date = Date.new(2017, 01, 01)
    end_date = start_date + 3
    room_number = 1
  #act
    reservation = Hotel::Reservation.new(start_date, end_date, room_number)
  # assert
      expect(reservation.start_date).must_equal start_date
      expect(reservation.end_date).must_equal end_date
      expect(reservation.room_number).must_equal room_number
    end
  end
end

##########################
  describe "cost" do
    it "returns a number" do
      # arrange
      start_date = Date.new(2017, 01, 01)
      end_date = start_date + 3
      # act
      reservation = Hotel::Reservation.new(start_date, end_date, 5)
      #arrange
      expect(reservation.cost).must_be_kind_of Numeric
    end

    it "returns the correct amount for nights spent" do
      #arrange
      start_date = Date.new(2017, 01, 01)
      end_date = start_date + 3
      #act
      reservation = Hotel::Reservation.new(start_date, end_date, 4)
      #assert
      expect(reservation.cost).must_equal 600
    end
  end

