require 'date'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/hotel'
require_relative '../lib/room'
require_relative '../lib/reservation'

describe "room" do 

  it "creates an instance of room" do 
    room = HotelSystem::Room.new(7, 100)
    room.must_be_instance_of HotelSystem::Room 
  end 

  it "I access the list of reservations for a specified room" do
    res1 = HotelSystem::Reservation.new(1, Date.today, Date.new(2020,03,29))
    res2 = HotelSystem::Reservation.new(2, Date.new(2020, 03, 29), Date.new(2020, 04,02))
    res3 = HotelSystem::Reservation.new(3, Date.new(2020, 04, 06), Date.new(2020,04,18))
    
    room = HotelSystem::Room.new(5, 200)
    room.add_reservation(res1)
    room.add_reservation(res2)
    room.add_reservation(res3)

    res = room.reservations

    res.must_be_instance_of Array 

  end



end 

describe "class methods" do 
  it "returns a boolean for is_room_available?" do 
    res1 = HotelSystem::Reservation.new(1, Date.today, Date.new(2020,03,29))
    res2 = HotelSystem::Reservation.new(2, Date.new(2020, 03, 29), Date.new(2020, 04,02))
    res3 = HotelSystem::Reservation.new(3, Date.new(2020, 04, 06), Date.new(2020,04,18))
    
    room = HotelSystem::Room.new(5, 200)
    room.add_reservation(res1)
    room.add_reservation(res2)
    room.add_reservation(res3)

    #def is_room_available?(start_date, end_date)
    
    answer = room.is_room_available?(Date.new(2020, 03, 07), Date.new(2020, 03, 31)) # shoudl return false

    answer.must_equal false 
  end 

  # it "lists reservations" do 
    
  #     res1 = HotelSystem::Reservation.new(1, Date.today, Date.new(2020,03,29))
  #     res2 = HotelSystem::Reservation.new(2, Date.new(2020, 03, 29), Date.new(2020, 04,02))
  #     res3 = HotelSystem::Reservation.new(3, Date.new(2020, 04, 06), Date.new(2020,04,18))
      
  #     room = HotelSystem::Room.new(5, 200)
  #     room.add_reservation(res1)
  #     room.add_reservation(res2)
  #     room.add_reservation(res3)

  #     printed = room.list_reservations()

  #     printed.m
  # end 
end 