require_relative 'reservation'
require_relative 'room'
require_relative 'date_range'

module Hotel
  class HotelController
    attr_reader :rooms, :get_available_rooms, :access_reservations
    attr_accessor :reserve_room
    def initialize
      @rooms = Array.new(20) { |i| Room.new(i + 1) } 
      @hotel_reservations = [] 
      
    end
    
    def reserve_room(room_to_reserve, date_range, hotel_block = :no)
      if !room_to_reserve.check_availability(date_range) 
        raise ArgumentError.new("This room is not available") 
      else
        new_reservation = Reservation.new(date_range, room_to_reserve, hotel_block) 
        room_to_reserve.add_reservation(new_reservation)
        @hotel_reservations << new_reservation
        return new_reservation
      end
    end
    
    def get_available_rooms(date_range) 
      rooms_available = []
      @rooms.each do |room|
        if room.check_availability(date_range)
          rooms_available << room 
        end     
      end 
      return rooms_available
    end
    
    def access_reservations(date_range) 
      list_reservations = []
      
      @hotel_reservations.each do |r|
        if r.date_range.include_date_range?(date_range)
          list_reservations << r
        end 
      end 
      return list_reservations
    end 
    
    def reserve_block(date_range, rooms_to_reserve)
      raise ArgumentError if !(3..5).include?(rooms_to_reserve.length)
      rooms_to_reserve.each do |room|
        begin
          self.reserve_room(room, date_range, :yes)      
        rescue => exception
          puts "Unable to reserve block: #{exception}"
        end
      end 
    end 
    
  end
end