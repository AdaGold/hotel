require_relative "test_helper"

describe "front_desk" do
  before do
    @moody_moon_hotel = Hotel::FrontDesk.new()
    @all_rooms = []
    20.times do |i|
      @all_rooms << "#{i + 1}"
    end

    @all_reservations = []
  end
  describe "initiate" do
    it "Should be instantiated with no given Arguments" do
      expect(@moody_moon_hotel).must_be_kind_of Hotel::FrontDesk
    end
  end

  describe "all_reservations instance variable" do
    it "Should be an empty array at the beggining" do
      expect(@moody_moon_hotel.instance_variable_get(:@all_reservations)).must_be_kind_of Array
      expect(@moody_moon_hotel.instance_variable_get(:@all_reservations)).must_be_empty
    end
  end

  describe "list_of_all_rooms" do
    it "Should have a method list_of_all_rooms" do
      expect(@moody_moon_hotel).must_respond_to :list_of_all_rooms
    end

    it "Should give an array of all the rooms in the hotel" do
      expect(@moody_moon_hotel.list_of_all_rooms).must_equal @all_rooms
    end
  end

  describe "reserve_room" do
    before do 

    end
    it "Should create an instance of Reservation when given start_date, end_date, guest_name, room " do
        start_date = Date.new(2020, 2, 1)
        end_date = Date.new(2020, 2, 3)
        guest_name = "Moody McMoon"
        room = "2"
        @moody_moon_hotel.reserve_room(start_date, end_date, guest_name, room).each do |res| 
            expect(res).must_be_kind_of Hotel::Reservation
        end

    end
    it "Should return an array containing all of the reservations" do 
        
    end
    
    it "Should raise an ArgumentError when given a wrong room number" do
        start_date = Date.new(2020, 2, 1)
        end_date = Date.new(2020, 2, 3)
        guest_name = "Moody McMoon"
        room = "99"
        expect{@moody_moon_hotel.reserve_room(start_date, end_date, guest_name, room)}.must_raise ArgumentError
    end
  end
  #attributes list of all 20 rooms

  #methods
  #list_availble_rooms(date)
  #list_availble_rooms(start_date - end_date)
  #reserve_room(start_date - end_date)
  #list_reservations(date)

end
