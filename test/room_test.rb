require_relative "test_helper"

describe Hotel::Room do 

  before do 
    start_date = Date.new(2020, 03, 01)
    end_date = start_date + 3 
    date_range = Hotel::DateRange.new(start_date, end_date)
    @room = Hotel::Room.new(1)
    reservation = Hotel::Reservation.new(date_range, @room)
    @room.add_reservation(reservation)

  end 
  describe "Room class" do 
    
    it "can be created" do 
      expect(@room).must_be_kind_of Hotel::Room
    end 
    it "has an Intenger ID" do 
      expect(@room.id).must_be_kind_of Integer
    end 
  end 
  describe "Room reservations" do 
    it "is an array" do 
      expect(@room.reservations).must_be_kind_of Array
    end 
    it "is an array of instances of reservation" do 
      expect(@room.reservations[0]).must_be_kind_of Hotel::Reservation
    end
    it "date_range is an instance of DateRange" do
      expect(@room.reservations[0].date_range).must_be_kind_of Hotel::DateRange
    end 
    it "room is an instance of room" do 
      expect(@room.reservations[0].room).must_be_kind_of Hotel::Room
    end 
  end   
end 