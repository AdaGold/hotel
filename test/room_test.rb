require_relative "test_helper"

describe "Room" do
  before do
    @my_room = Hotel::Room.new("room 1")

    @patrick_reservation = Hotel::Reservation.new(
      start_date = Date.new(2020, 2, 2),
      end_date = start_date + 3,
      room: "room 1",
      guest_name: "patrick star",
    )

    @spongebob_reservation = Hotel::Reservation.new(
      start_date = Date.new(2020, 2, 5),
      end_date = start_date + 1,
      room: "room 1",
      guest_name: "spongebob squarepants",
    )

    @my_room.add_reservation_to_room(@patrick_reservation)
    @my_room.add_reservation_to_room(@spongebob_reservation)
  end

  describe "Initialize" do
    it "Should be initialized when given a room number" do
      expect(@my_room).must_be_instance_of Hotel::Room
    end

    it "Should have room_number and room_reservations (array) as instance variables" do
      expect(@my_room).must_respond_to :room_number
      expect(@my_room.room_number).must_equal "room 1"

      expect(@my_room).must_respond_to :room_reservations
      expect(@my_room.room_reservations).must_be_kind_of Array
    end
  end

  describe "add_reservation_to_room(reservation)" do
    it "The room_reservations should be an array of Reservation class" do
      @my_room.room_reservations.each do |reservation|
        expect(reservation).must_be_instance_of Hotel::Reservation
      end
    end
    it "Should include room's reservations" do
      expect(@my_room.room_reservations).must_include @spongebob_reservation
      expect(@my_room.room_reservations.length).must_equal 2
    end

    it "Should add new Reservation instances to the array list of room_reservations" do
      start_date = Date.new(2020, 3, 15)
      end_date = start_date + 1
      squidward_reservation = Hotel::Reservation.new(start_date, end_date, room: "room 1", guest_name: "squidward tentacles")
      expect(@my_room.add_reservation_to_room(squidward_reservation)).must_include squidward_reservation
      expect(@my_room.room_reservations.length).must_equal 3
    end

    it "Should raise an ArgumentError if a reservation not for that room class is passed in as a parameter" do
      start_date = Date.new(2020, 3, 20)
      end_date = start_date + 1
      mr_krab_reservation = Hotel::Reservation.new(start_date, end_date, room: "room 6", guest_name: "my krabs")
      expect { @my_room.add_reservation_to_room(mr_krab_reservation) }.must_raise ArgumentError
    end
  end

  describe "dates_unavailable" do
    it "should return an array of all dates the room is has been reserved for" do
      dates_reserved = [Date.new(2020, 2, 2), Date.new(2020, 2, 3), Date.new(2020, 2, 4), Date.new(2020, 2, 5)]
      expect(@my_room.dates_unavailable).must_equal dates_reserved
    end
    it "Dates of reservation must be unique" do
      expect(@my_room.dates_unavailable.uniq!).must_be_nil
    end
  end

  describe "is_available_during(start_date, end_date" do
    it "Should return false if the room is reservared within that date range" do
      start_date = Date.new(2020, 2, 2)
      end_date = start_date + 1
      expect(@my_room.is_available_during(start_date, end_date)).must_equal false
    end
    it "Should return true if the room is available for the given start and end date" do
      start_date = Date.new(2020, 3, 19)
      end_date = start_date + 1
      expect(@my_room.is_available_during(start_date, end_date)).must_equal true
    end
  end
end
