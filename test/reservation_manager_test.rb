require_relative 'test_helper'

describe "reservation manager test" do
  before do
    @stay_begin = Date.new(2020, 5, 20)
    @stay_end = Date.new(2020, 5, 28)
    @manager = Hotel::ReservationManager.new
    @manager.new_reservation(@stay_begin, @stay_end)
  end

  describe "initialize" do

    it "can be instantiated" do
      expect(@manager).must_be_instance_of Hotel::ReservationManager
    end

    it "will create an array of 20 rooms" do
      expect(@manager.rooms.length).must_equal 20
    end

    it "will populate the array with room objects" do
      expect(@manager.rooms[2]).must_be_instance_of Hotel::Room
    end
    
  end

  describe "create reservation" do

    it "will create an instance of the reservation class" do
      expect(@manager.rooms[0].reservations[-1]).must_be_instance_of Hotel::Reservation
    end
  
    it "will raise an argument error if the reservation starts before the current day" do
      start = Date.new(1990, 1, 1)
      expect{@manager.new_reservation(start, @stay_end)}.must_raise ArgumentError
    end

    it "will raise an argument error if the end date is before the start date" do
      start = Date.new(2020, 6, 20)
      expect{@manager.new_reservation(start, @stay_end)}.must_raise ArgumentError
    end

    it "will select an available room for the reservation dates" do
      19.times do 
        @manager.new_reservation(@stay_begin, @stay_end)
      end

      expect(@manager.rooms[19].number).must_equal 20
    end

    it "will raise an argument error if there are no available rooms to book for the given dates" do
      expect{
        21.times do 
          @manager.new_reservation(@stay_begin, @stay_end)
        end
      }.must_raise ArgumentError
    end

  end

  describe "room information" do
    
    it "will return a string containing a list of all rooms" do
      expect(@manager.rooms_list).must_be_instance_of String
    end

    it "will have a list of 20 lines" do
      list = @manager.rooms_list
      expect(list.split("\n").length).must_equal 20
    end

    it "will return a collection of all rooms available for a given date range" do
      @manager.new_reservation(@stay_begin, @stay_end)
      expect(@manager.room_list_by_availability(@stay_begin, @stay_end).length).must_equal 18
    end

  end

  describe "find reservations" do

    it "will provide a collection of reservations matching a given date range and a room number" do
      2.times do
        @manager.new_reservation(Date.new(2020, 7, 22), Date.new(2020, 7, 29))
      end
      expect(@manager.all_reservations_by_room(1, Date.new(2020, 5, 26), Date.new(2020, 9, 14)).length).must_equal 2
    end

    it "will provide a collection of reservations matching a given date range" do
      @manager.new_reservation(@stay_begin, @stay_end)
      expect(@manager.all_reservations_by_date(@stay_begin, @stay_end).length).must_equal 2
    end

  end

  describe "create block reservation" do
    before do
      @available_rooms = @manager.room_list_by_availability(Date.new(2021, 1, 10), Date.new(2021, 1, 20))
      @block = @manager.new_block(@available_rooms[0..4], Date.new(2021, 1, 10), Date.new(2021, 1, 20), 100)
    end
    
    it "will create a block hotel reservation for the given dates" do
      expect(@block).must_be_instance_of Hotel::Block
    end

    it "will select the correct number of available rooms" do
      expect(@block.rooms.length).must_equal 5
    end

    it "will adjust the price of the reservation according to the given rate" do
      expect(@block.rate).must_equal 100
    end

    it "will raise an argument error if a room that is being reserved is not available" do
      
    end

    it "cannot have more than 5 rooms" do
      expect{@manager.new_block(@available_rooms[0..5], Date.new(2021, 1, 10), Date.new(2021, 1, 20), 100)}.must_raise ArgumentError
    end



  end

end