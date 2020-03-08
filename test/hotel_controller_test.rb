require_relative "test_helper"

describe Hotel::HotelController do
  before do
    start_date = Date.new(2020, 01, 04)
    end_date = start_date + 3
    @hotel_controller = Hotel::HotelController.new
    @date_range = Hotel::DateRange.new(start_date, end_date)
    @reservation = @hotel_controller.reserve_room(@date_range)
    @room_list = @hotel_controller.get_available_rooms(@date_range)
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
    
    describe "reserve a room" do
      it "takes date_range object and returns a Reservation" do
        expect(@reservation).must_be_kind_of Hotel::Reservation
      end
      it "date range is an instance of the class DateRange" do 
        expect(@reservation.date_range).must_be_kind_of Hotel::DateRange
      end
    end

    describe "get_available_rooms" do
      it "takes a date_range and returns a list" do
        expect(@room_list).must_be_kind_of Array
      end
      it "returns a list of instances of rooms" do 
        expect(@room_list[0]).must_be_kind_of Hotel::Room
      end 
      it "return an array with all the available rooms" do
        expect(@room_list.length).must_equal 19
      end 
      
      describe "access reservations" do 
        it "returns an array" do 
          array = @hotel_controller.access_reservations(@date_range)
          expect(array).must_be_kind_of Array
        end 
        it "returns an array of reservations for the date range" do 
          reservations = @hotel_controller.access_reservations(@date_range)[0]
          expect(reservations).must_be_kind_of Hotel::Reservation
        end 
        it "returns only reservations within the date range" do 
          reservations = @hotel_controller.access_reservations(@date_range)
          expect()
        end 

      end 
    end 
  end
end