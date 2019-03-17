require_relative "spec_helper.rb"

describe "HotelSystem class" do
  let (:first_reservation) {
    start_date = Date.today
    end_date = start_date + 2
    Hotel::Reservation.new(start_date, end_date, 1)
  }

  let (:second_reservation) {
    start_date = Date.today
    end_date = start_date + 3
    Hotel::Reservation.new(start_date, end_date, 2)
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

  describe "HotelSystem reserves rooms" do
    it "returns an instance of reservation" do
      expect(hotel_system.reserve_room(Date.today + 2, Date.today + 4)).must_be_kind_of Hotel::Reservation
    end

    it "raises error when given invalid dates" do
      expect {
        hotel_system.reserve_room(Date.today, Date.today - 1).must_raise ArgumentError
      }
    end

    it "reserves first available room" do
      expect(hotel_system.reserve_room(Date.today + 1, Date.today + 2).room).must_equal 3
    end
  end

  describe "HotelSystem mananges reservations by date" do
    let (:reservation_matches) {
      hotel_system.reservations_by_date(Date.today)
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

  describe "accurately manages occupied rooms" do
    it "returns instance of an occupied room" do
      expect(hotel_system.occupied_rooms(Date.today)[0]).must_equal first_reservation.room
    end

    it "returns empty array when not occupied" do
      no_reservations = hotel_system.occupied_rooms(Date.today + 20)
      expect(no_reservations).must_be_kind_of Array
      expect(no_reservations.length).must_equal 0
    end
  end

  describe "manages available rooms" do
    it "returns array with available rooms" do
      expect(hotel_system.available_rooms(Date.today)).must_be_kind_of Array
    end

    it "returns correct number of available rooms" do
      expect(hotel_system.available_rooms(Date.today).length).must_equal 18
    end
  end
end
