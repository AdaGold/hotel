require_relative 'room'
require_relative 'reservation'
require 'awesome_print'

module HotelSystem 
  class Hotel 
    attr_accessor :rooms
   
    def initialize
      @rooms = create_rooms
    end 
    
    def find_reservations_with_room_number(room_number, start_date, end_date)
      room = find_room(room_number)
      list_reservations = []
        room.reservations.each do |reservation|
          if is_between_two_dates([start_date, end_date], reservation.start_date) || is_between_two_dates([start_date, end_date], reservation.end_date) 
            list_reservations << reservation
          end
        end 
      return list_reservations
    end 

    def list_reservations_dates(start_date, end_date) 
      list_reservations = []
      @rooms.each do |room|
        room.reservations.each do |reservation|
          if is_between_two_dates([start_date, end_date], reservation.start_date) || is_between_two_dates([start_date, end_date], reservation.end_date) 
            list_reservations << reservation
          end 
        end 
      end  
      return list_reservations
    end 
    
    def find_room(room_number)
      @rooms.each do |room| 
        if room_number == room.room_number 
          return room
        end 
      end
    end

    def find_reservation(reservation_number)
      @rooms.each do |room|
        room.reservations.each do |reservation|
          if reservation.reservation_number == reservation_number
            return reservation
          end 
        end 
      end 
    end 

    def total_cost(reservation_number)
      res = find_reservation(reservation_number)
      return res.total_cost
    end 

    def available_rooms(start_date, end_date) 
      list_rooms = []
      @rooms.each do |room|
          if room.reservations.length == 0 || room.reservations == nil 
            list_rooms << room 
          elsif no_shared_days?(start_date, end_date, room.reservations.last) === true 
            list_rooms << room
          end 
        end  
      return list_rooms
    end 


    def make_reservation(room_number)
      #TODO create method 
      #try to
     
    end 
    
    def no_shared_days?(start_date, end_date, reservation)
      count = 0 
      reservation_start = reservation.start_date
      reservation_end = reservation.end_date
      i = 1

      while start_date < end_date
        while reservation_start < reservation_end
          if start_date == reservation_start  
            count += 1
          end 
          reservation_start += 1
       end 
       reservation_start = reservation.start_date + i 
       start_date += 1
       i +=1 
      end 
      return count < 2
    end 

    private

    def create_rooms
      rooms = []
      20.times do |i|
        rooms << HotelSystem::Room.new(i+1, 200)
      end 
      return rooms
    end 

    def is_between_two_dates(range_wanted, date)
      return date >= range_wanted[0] && date <= range_wanted[1];
    end

   

  end 
end 


