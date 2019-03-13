require_relative "spec_helper.rb"

describe "HotelSystem class" do
  let (:first_reservation) {
    start_date = Date.new(2019, 3, 23)
    end_date = start_date + 2
    Hotel::Reservation.new(start_date, end_date)
  }

  let (:second_reservation) {
    start_date = Date.new(2020, 3, 23)
    end_date = start_date + 3
    Hotel::Reservation.new(start_date, end_date)
  }

  let (:hotel_system) {
    Hotel::HotelSystem.new
  }

  describe "HotelSystem instantiation" do
    it "creates an instance of HotelSystem" do
      expect(:hotel_system).must_be_kind_of Hotel::HotelSystem
    end
  end

  describe "HotelSystem manages rooms" do
    it "creates an array of rooms" do
      expect(hotel_system.list_rooms).must_be_kind_of Array
    end

    it "lists 20 rooms" do
      expect(hotel_system.list_rooms.length).must_equal 20
    end
  end

  describe "HotelSystem mananges reservations" do
    it "creates an array of reservations" do
      # expect that hotel system can list an array of reservations
    end

    it "stores instances of reservations" do
      # expect that hotel system can pass reservations as an argument
    end
  end
end
