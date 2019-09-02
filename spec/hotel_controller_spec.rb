require_relative "spec_helper"

describe Hotel::HotelController do
  before do
    @hotel_controller = Hotel::HotelController.new
    @date = Date.parse("2020-08-04")
  end
  describe "wave 1" do
    describe "rooms" do
      it "returns a list" do
        rooms = @hotel_controller.rooms
        expect(rooms).must_be_kind_of Array
      end
    end
    describe "reserve_room" do
      it "takes two Date objects and returns a Reservation" do
        start_date = @date
        end_date = start_date + 3

        reservation = @hotel_controller.reserve_room(start_date, end_date, 1)

        expect(reservation).must_be_kind_of Hotel::Reservation
      end

      it "raises an argument error if room is not available" do
        start_date = @date
        end_date = start_date + 3

        reservation = @hotel_controller.reserve_room(start_date, end_date, 1)

        expect{@hotel_controller.reserve_room(start_date, end_date, 1)}.must_raise ArgumentError
      end

    end

    describe "get_reservations" do
      it "takes a Date and returns a list of Reservations" do
        reservation_list = @hotel_controller.get_reservations(@date)

        expect(reservation_list).must_be_kind_of Array
        reservation_list.each do |res|
          res.must_be_kind_of Reservation
        end
      end
    end
  end

  describe "wave 2" do
    describe "get_available_rooms" do
      it "takes two dates and return a list of the correct available rooms" do
        start_date = @date
        end_date = start_date + 3

        reservation = @hotel_controller.reserve_room(start_date, end_date, 1)
        reservation = @hotel_controller.reserve_room(start_date, end_date, 2)
        reservation = @hotel_controller.reserve_room(start_date, end_date, 3)
        reservation = @hotel_controller.reserve_room(start_date, end_date, 4)
        reservation = @hotel_controller.reserve_room(start_date, end_date, 5)

        room_list = @hotel_controller.get_available_rooms(start_date, end_date)

        expect(room_list).must_equal [6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
      end
    end
  end
end
