require_relative 'room'
require_relative 'reservation'

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
      #TODO create method 
      #try to use enumerables
    end 


    def make_reservation(room_number)
      #TODO create method 
      #try to
     
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




