require_relative "test_helper"

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
      it "value is an instance of room" do 
        room_one = @hotel_controller.rooms[1]
        expect(room_one).must_be_kind_of Hotel::Room
      end 

      it "array is size 20 rooms" do 
        length_rooms = @hotel_controller.rooms.length
        expect(length_rooms).must_equal 20
      end   

      it "first number of hotel id is 1" do 
        first_room = @hotel_controller.rooms[0].id
        expect(first_room).must_equal 1
      end 

      it "last number of the hotel id is 20" do 
        last_room = @hotel_controller.rooms[-1].id
        expect(last_room).must_equal 20 
      end 
    end
    
    describe "reserve_room" do
      it "takes two Date objects and returns a Reservation" do
        start_date = @date
        end_date = start_date + 3

        reservation = @hotel_controller.reserve_room(start_date, end_date)

        expect(reservation).must_be_kind_of Hotel::Reservation
      end
    end

  #   xdescribe "reservations" do
  #     it "takes a Date and returns a list of Reservations" do
  #       reservation_list = @hotel_controller.reservations(@date)

  #       expect(reservation_list).must_be_kind_of Array
  #       reservation_list.each do |res|
  #         res.must_be_kind_of Reservation
  #       end
  #     end
  #   end
  # end

  # xdescribe "wave 2" do
  #   describe "available_rooms" do
  #     it "takes two dates and returns a list" do
  #       start_date = @date
  #       end_date = start_date + 3

  #       room_list = @hotel_controller.available_rooms(start_date, end_date)

  #       expect(room_list).must_be_kind_of Array
  #     end
  #   end
  end
end