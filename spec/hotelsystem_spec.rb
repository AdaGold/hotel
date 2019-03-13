require_relative "spec_helper.rb"

describe "HotelSystem class" do
  let (:first_reservation) {
    start_date = Date.today
    end_date = start_date + 2
    Hotel::Reservation.new(start_date, end_date)
  }

  let (:second_reservation) {
    start_date = Date.today
    end_date = start_date + 3
    Hotel::Reservation.new(start_date, end_date)
  }

  let (:hotel_system) {
    Hotel::HotelSystem.new(reservations = [first_reservation, second_reservation])
  }

  describe "HotelSystem instantiation" do
    it "creates an instance of HotelSystem" do
      expect(hotel_system).must_be_kind_of Hotel::HotelSystem
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
    let (:reservation_matches) {
      reservation_matches = hotel_system.reservations_by_date(Date.today)
    }

    it "returns array of all reservations" do
      reservation_matches.each do |reservation|
        expect(reservation).must_be_kind_of Hotel::Reservation
      end
    end

    it "returns the proper number of reservations" do
      expect(reservation_matches.length).must_equal 2
    end

    it "returns empty array if there are no matches" do
      no_reservations = hotel_system.reservations_by_date(Date.today + 20)
      expect(no_reservations).must_be_kind_of Array
      expect(no_reservations.length).must_equal 0
    end
  end
end
