


require_relative 'test_helper'



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


describe "other instance methods" do 

  it "finds a room " do 
    hotel = HotelSystem::Hotel.new
    room = hotel.find_room(1)
    room.must_be_instance_of HotelSystem::Room

  end 

  it "finds an array of reservations" do 
  
    hotel = HotelSystem::Hotel.new

    room = hotel.find_room(1)
    
    res1 = HotelSystem::Reservation.new(1, Date.today, Date.new(2020,03,29))
    res2 = HotelSystem::Reservation.new(2, Date.new(2020, 03, 29), Date.new(2020, 04,02))

    room.add_reservation(res1)
    room.add_reservation(res2)
    reservation = room.reservations[1]

    reservation.must_be_instance_of HotelSystem::Reservation 

  end
 

  it "I access the list of reservations for a specified room and a given date range" do
    res1 = HotelSystem::Reservation.new(1, Date.today, Date.new(2020,03,29))
    res2 = HotelSystem::Reservation.new(2, Date.new(2020, 03, 29), Date.new(2020, 04,02))
    res3 = HotelSystem::Reservation.new(3, Date.new(2020, 04, 06), Date.new(2020,04,18))
    

    hotel = HotelSystem::Hotel.new 
    
    hotel.rooms[1].add_reservation(res1)
    hotel.rooms[1].add_reservation(res2)
    hotel.rooms[1].add_reservation(res3)


    array = hotel.find_reservations_with_room_number(2 , Date.new(2020, 03, 07), Date.new(2020, 03, 13))

    array.must_be_instance_of Array 

  end


  it "outputs the correct reservations" do 
     

    res1 = HotelSystem::Reservation.new(1, Date.new(2020,04,03), Date.new(2020,04,06))
    res2 = HotelSystem::Reservation.new(2, Date.new(2020, 03, 06), Date.new(2020, 03,11)) 

    res3 = HotelSystem::Reservation.new(3, Date.new(2020, 03, 31), Date.new(2020,04,02)) 

    hotel = HotelSystem::Hotel.new
    hotel.rooms[1].add_reservation(res2)
    hotel.rooms[1].add_reservation(res3)
    hotel.rooms[2].add_reservation(res1)
    
    array = hotel.list_reservations_dates(Date.new(2020, 03, 07), Date.new(2020, 03, 31))
    
    array.must_equal [res2, res3]
  end 


  it "finds the correct reservations given a room number" do 

    res1 = HotelSystem::Reservation.new(1, Date.new(2020,04,03), Date.new(2020,04,06))
    res2 = HotelSystem::Reservation.new(2, Date.new(2020, 03, 06), Date.new(2020, 03,11)) 

    res3 = HotelSystem::Reservation.new(3, Date.new(2020, 03, 31), Date.new(2020,04,02))

    hotel = HotelSystem::Hotel.new
    hotel.rooms[1].add_reservation(res2)
    hotel.rooms[1].add_reservation(res1)
    hotel.rooms[10].add_reservation(res3)
    
    
    array = hotel.find_reservations_with_room_number(11, Date.new(2020, 03, 07), Date.new(2020, 03, 31))

    array.must_equal [res3]

  end 


  it "finds the correct reservations given a room number - test 2" do 

    res1 = HotelSystem::Reservation.new(1, Date.new(2020,04,03), Date.new(2020,04,06))
    res2 = HotelSystem::Reservation.new(2, Date.new(2020, 03, 06), Date.new(2020, 03,11)) 

    res3 = HotelSystem::Reservation.new(3, Date.new(2020, 03, 31), Date.new(2020,04,02))

    hotel = HotelSystem::Hotel.new
    hotel.rooms[1].add_reservation(res2)
    hotel.rooms[1].add_reservation(res1)
    hotel.rooms[10].add_reservation(res3)
    

    array = hotel.find_reservations_with_room_number(2, Date.new(2020, 03, 07), Date.new(2020, 03, 31))

    array.must_equal [res2]

  end 
  
  it "finds the available rooms" do 
    res1 = HotelSystem::Reservation.new(1, Date.new(2020,04,03), Date.new(2020,04,06))
    res2 = HotelSystem::Reservation.new(2, Date.new(2020, 03, 06), Date.new(2020, 03,11)) 

    res3 = HotelSystem::Reservation.new(3, Date.new(2020, 03, 31), Date.new(2020,04,02))

    hotel = HotelSystem::Hotel.new
    hotel.rooms[1].add_reservation(res2)
    hotel.rooms[1].add_reservation(res1)
    hotel.rooms[10].add_reservation(res3)

    avail_rooms = hotel.available_rooms(Date.new(2020, 03, 06), Date.new(2020, 03, 18)) 

    avail_rooms.must_be_instance_of Array 


  end 

  it "evaluates overlapping correcty " do 
    hotel = HotelSystem::Hotel.new

    res3 = HotelSystem::Reservation.new(3, Date.new(2020, 03, 06), Date.new(2020, 03,29))
    answer = hotel.no_shared_days?(Date.new(2020, 03, 18), Date.new(2020, 04, 18), res3)


    answer.must_equal false

  end

  it "must raise argument error if there is an invalid reservation" do
    
    hotel = HotelSystem::Hotel.new

    res3 = HotelSystem::Reservation.new(3, Date.new(2020, 03, 06), Date.new(2020, 03,29))
    hotel.rooms[1].add_reservation(res3)
    #make_reservation(room_number, start_date, end_date)

    expect{hotel.make_reservation(2, Date.new(2020, 03, 07), Date.new(2020, 04, 1))}.must_raise ArgumentError
  end 

  it "must make a reservation inside of specified room" do 
    hotel = HotelSystem::Hotel.new

    res3 = HotelSystem::Reservation.new(3, Date.new(2020, 03, 06), Date.new(2020, 03, 18))
    hotel.rooms[1].add_reservation(res3)
    

    hotel.make_reservation(2, Date.new(2020, 03, 18), Date.new(2020, 04, 01))

    hotel.rooms[1].reservations.length.must_equal 2 
  end 

  it "finds the total cost of a reservation" do 

    res1 = HotelSystem::Reservation.new(1, Date.new(2020,04,03), Date.new(2020,04,06))
    res2 = HotelSystem::Reservation.new(2, Date.new(2020, 03, 06), Date.new(2020, 03,11)) 

    res3 = HotelSystem::Reservation.new(3, Date.new(2020, 03, 31), Date.new(2020,04,02))

    hotel = HotelSystem::Hotel.new
    hotel.rooms[1].add_reservation(res2)
    hotel.rooms[1].add_reservation(res1)
    hotel.rooms[10].add_reservation(res3)
    

    cost = hotel.total_cost(1)

    
    cost.must_equal 600

  end 

end 