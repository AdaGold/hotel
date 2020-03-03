
require 'date'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/hotel'
require_relative '../lib/room'
require_relative '../lib/reservation'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "initialize" do 
  it "I can access the list of all of the rooms in the hotel" do 
    hotel = HotelSystem::Hotel.new 
    hotel.must_be_instance_of HotelSystem::Hotel

  end 

  it "an element in Hotel object must be a room" do 
    hotel = HotelSystem::Hotel.new 
    room = hotel.rooms[1]
    room.must_be_instance_of HotelSystem::Room 

  end 

end
# def find_reservations_with_date(room_number, start_date, end_date)

describe "other instance methods" do 

  it "finds a room " do 
  
    hotel = HotelSystem::Hotel.new

    room = hotel.find(1)

    room.must_be_instance_of HotelSystem::Room

  end 

  it "finds an array of reservations" do 
  
    hotel = HotelSystem::Hotel.new

    room = hotel.find(1)
    
    res1 = HotelSystem::Reservation.new(1, Date.new(2020, 02, 18), Date.new(2020,02,29))
    res2 = HotelSystem::Reservation.new(2, Date.new(2020, 02, 29), Date.new(2020, 03,02))
    res3 = HotelSystem::Reservation.new(3, Date.new(2020, 03, 06), Date.new(2020,03,18))
    room.add_reservation(res1)
    room.add_reservation(res2)
    reservation = room.reservations[1]

    reservation.must_be_instance_of HotelSystem::Reservation 

  end
 

  it "I access the list of reservations for a specified room and a given date range" do

    res1 = HotelSystem::Reservation.new(1, Date.new(2020, 02, 18), Date.new(2020,02,29))
    res2 = HotelSystem::Reservation.new(2, Date.new(2020, 02, 29), Date.new(2020, 03,02))
    res3 = HotelSystem::Reservation.new(3, Date.new(2020, 03, 06), Date.new(2020,03,18))
    

    hotel = HotelSystem::Hotel.new 
    
    hotel.rooms[1].add_reservation(res1)
    hotel.rooms[1].add_reservation(res2)
    hotel.rooms[1].add_reservation(res3)


    array = hotel.find_reservations_with_date( 1 , Date.new(2020, 02, 17), Date.new(2020, 02, 13))

    array.must_be_instance_of Array 

  end


end 