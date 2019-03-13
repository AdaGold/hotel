require_relative "spec_helper.rb"

describe "HotelSystem class" do
  let (:reservation) {
    start_date = Date.new(2019, 3, 23)
    end_date = start_date + 2
    Hotel::Reservation.new(start_date, end_date)
  }

  let (:hotel_system) {
    Hotel::HotelSystem.new
  }

  describe "HotelSystem instantiation" do
    it "creates an instance of HotelSystem" do
      hotel = Hotel::HotelSystem.new
      expect(hotel).must_be_kind_of Hotel::HotelSystem
    end

    it "creates an array of rooms" do
      hotel = Hotel::HotelSystem.new
      expect(hotel.list_rooms).must_be_kind_of Array
    end
  end

  describe "HotelSystem lists all rooms" do
    it "lists 20 rooms" do
      hotel = Hotel::HotelSystem.new
      expect(hotel.list_rooms.length).must_equal 20
    end
  end
end
