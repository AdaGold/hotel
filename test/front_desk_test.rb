require_relative "test_helper"

describe "front_desk" do
  before do
    @pineapple_villa = Hotel::FrontDesk.new()

    @start_date = Date.new(2020, 2, 2)
    @end_date = @start_date + 3

    @spongebob_reservation = @pineapple_villa.reserve_room(@start_date, @end_date, guest_name: "spongebob squarepants", room: "room 2")

    @patrick_reservation = @pineapple_villa.reserve_room(@start_date, @end_date, guest_name: "patrick star", room: "room 1")

    @room_1 = @pineapple_villa.all_rooms.find do |room_object|
      room_object.room_number == "room 1"
    end

    @room_2 = @pineapple_villa.all_rooms.find do |room_object|
      room_object.room_number == "room 2"
    end

    @list_of_reservation_for_given_date = @pineapple_villa.list_of_reservations(@start_date)
  end

  describe "initiate" do
    it "Should be instantiated with no given Arguments" do
      expect(@pineapple_villa).must_be_instance_of Hotel::FrontDesk
    end
  end

  describe "instance variable" do
    it "Should have all_reservations that is an array of all hotel reservations" do
      expect(@pineapple_villa).must_respond_to :all_reservations
      expect(@pineapple_villa.all_reservations).must_be_kind_of Array
      @pineapple_villa.all_reservations.each do |reservation|
        expect(reservation).must_be_instance_of Hotel::Reservation
      end
    end

    it "Should have a list of all rooms" do
      expect(@pineapple_villa).must_respond_to :all_rooms
      expect(@pineapple_villa.all_rooms.length).must_equal 20
    end

    it "all_rooms should contain instances of Room object" do
      @pineapple_villa.all_rooms.each do |room|
        expect(room).must_be_instance_of Hotel::Room
      end
    end
  end

  describe "list_of_available_rooms(start_date, end_date)" do
    it "Should return an array of all available rooms given that date range" do
      start_date = Date.new(2020, 2, 14)
      end_date = start_date + 1
      expect(@pineapple_villa.list_of_available_rooms(start_date, end_date).length).must_equal 20
    end

    it "Should reject all the rooms reserved within the date range given" do
      start_date = Date.new(2020, 2, 3)
      end_date = Date.new(2020, 2, 5)
      expect(@pineapple_villa.list_of_available_rooms(start_date, end_date)).wont_include @room_1
      expect(@pineapple_villa.list_of_available_rooms(start_date, end_date)).wont_include @room_2
      expect(@pineapple_villa.list_of_available_rooms(start_date, end_date).length).must_equal 18
    end
  end

  describe "reserve_room" do
    before do
    end
    it "Should create an instance of Reservation when given start_date, end_date, guest_name, room " do
      expect(@spongebob_reservation).must_be_kind_of Hotel::Reservation
      expect(@pineapple_villa.all_reservations).must_include @spongebob_reservation
    end

    it "Should raise an ArgumentError when given a wrong room number" do
      start_date = Date.new(2020, 2, 1)
      end_date = Date.new(2020, 2, 3)
      guest_name = "Sandy Cheeks"
      room = "room 99"
      expect { @pineapple_villa.reserve_room(start_date, end_date, guest_name: guest_name, room: room) }.must_raise ArgumentError
    end

    it "Should raise an ArgumentError if the date range is taken for that room" do
      start_date = Date.new(2020, 2, 3)
      end_date = start_date + 1
      guest_name = "Sandy Cheeks"
      room = "room 2"
      expect { @pineapple_villa.reserve_room(start_date, end_date, guest_name: guest_name, room: room) }.must_raise ArgumentError
    end

    it "should add the reservation to the rooms reservation list" do
      expect(@room_1.room_reservations).must_include @patrick_reservation
      expect(@room_2.room_reservations).must_include @spongebob_reservation
    end

    it "the reservation list of a room must be for that room only" do
      @room_1.room_reservations.each do |reservation|
        expect(reservation.room).must_equal "room 1"
      end
    end

    it "Should add the reservation to the Hotel's total reservations" do
      expect(@pineapple_villa.all_reservations).must_include @spongebob_reservation
      expect(@pineapple_villa.all_reservations).must_include @patrick_reservation
    end
  end

  describe "list_of_reservations(date)" do
    it "Should return a list of Reservations for that date" do
      expect(@list_of_reservation_for_given_date).must_equal [@spongebob_reservation, @patrick_reservation]
    end
  end
end
