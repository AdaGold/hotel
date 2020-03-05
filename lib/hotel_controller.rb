require_relative 'reservation'
require_relative 'room'
require_relative 'date_range'
module Hotel
  class HotelController

    #Hotel controller makes the reservation using the attributes of reservation class 
    attr_reader :rooms, :reserve_room, :reservations, :get_available_rooms
    def initialize
      @rooms = Array.new(20) { |i| Room.new(i + 1) } 
      @reservations = [] 
    end

    def reserve_room(date_range)
      available_rooms = get_available_room(date_range)
      available_room = available_rooms[0]
  
      new_reservation = Reservation.new(date_range, available_room) #find the available room 
      @reservations << new_reservation
      
      return new_reservation
    end

    # def lookup_reservation_by_date(date_range) 
    #     return
    # end

    # def get_available_rooms(date_range) #list of rooms 
    #   rooms_available = []
    #   @rooms.each do |room|
    #     if room.check_availability(date_range)
          
    #   end 
    #   return rooms_available
    # end


  end
end



