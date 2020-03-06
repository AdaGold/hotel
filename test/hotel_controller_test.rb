require_relative "test_helper"

describe Hotel::HotelController do
  before do
    @hotel_controller = Hotel::HotelController.new
    @date = Date.parse("2020-08-04")
  end
  describe "hotelcontroller" do
    describe "rooms" do
      it "returns a list" do
        rooms = @hotel_controller.rooms
        expect(rooms).must_be_kind_of Array
      end
    end
  end
     describe "list_reservations_for_room" do
      it "returns a list of reservations that fall with in the given date range for a specific room." do

        # Arrange : add a new Reservation for room #2 from March 1, March 5
        start_date = Date.new(2017, 03, 01)
        end_date = Date.new(2017, 03, 05)
        room = 2

        @hotel_controller.reservations  << Hotel::Reservation.new(start_date, end_date, room)

        # Arrange : add a new Reservation for room #2 from March 10, March 15
        start_date = Date.new(2017, 03, 10)
        end_date = Date.new(2017, 03, 15)
        room = 2

        @hotel_controller.reservations  << Hotel::Reservation.new(start_date, end_date, room)

        # Arrange : add a new Reservation for room #2 from March 20, March 23
        start_date = Date.new(2017, 03, 20)
        end_date = Date.new(2017, 03, 23)
        room = 2

        @hotel_controller.reservations  << Hotel::Reservation.new(start_date, end_date, room)
       
        # act
        all_found_reservations = @hotel_controller.list_reservations_for_room(2, Date.new(2017, 03, 01), Date.new(2017, 03, 31))

        #assert
        expect(all_found_reservations.length).must_equal 3
       end
      end
    
    describe "reserve_room" do
      it "takes two Date objects and returns a Reservation" do
        # arrange
        start_date = @date
        end_date = start_date + 3
        # act
        reservation = @hotel_controller.reserve_room(start_date, end_date)
        # assert
        expect(reservation).must_be_kind_of Hotel::Reservation
      end

      it "return false if there are no availalbe rooms" do 
        # arrange
        start_date = Date.new(2017, 01, 01)
        end_date = Date.new(2017, 02, 01)
  
        20.times do # create a list of 20 resereved rooms
          @hotel_controller.reserve_room(start_date, end_date) # act
        end

        # assert
        expect{(@hotel_controller.reserve_room(start_date, end_date))}.must_raise ArgumentError
      end
    end

      
    describe "reservations" do

      it "takes a Date and returns a list of Reservations" do
        reservation_list = @hotel_controller.show_reservations_for_date(@date)

        expect(reservation_list).must_be_kind_of Array
        reservation_list.each do |res|
          res.must_be_kind_of Reservation
        end
      end

    end

    describe "show_reservations_for_date" do
      it "show reservations whose range include the given date" do
      #arrange
      @hotel_controller.reserve_room(Date.new(2017, 02, 20), Date.new(2017, 03, 03))
      @hotel_controller.reserve_room(Date.new(2017, 03, 01), Date.new(2017, 03, 05))

      #act
      reserved = @hotel_controller.show_reservations_for_date(Date.new(2017, 03, 01))
      
      #assert
      expect(reserved.length).must_equal 2
      end

    end


  describe "wave 2" do
    describe "find_available_rooms" do
      it "takes two dates and returns a list" do
        start_date = @date
        end_date = start_date + 3

        room_list = @hotel_controller.find_available_rooms(start_date, end_date)

        expect(room_list).must_be_kind_of Array
      end
    end
  end
end
