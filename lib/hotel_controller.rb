require_relative 'reservation'
require_relative 'room'
require_relative 'date_range'

module Hotel
  class HotelController

    #Hotel controller makes the reservation using the attributes of reservation class 
    attr_reader :rooms, :reserve_room, :get_available_rooms
    def initialize
      @rooms = Array.new(20) { |i| Room.new(i + 1) } 
    end

    def reserve_room(date_range)
      room_to_reserve = get_available_rooms(date_range)[0] #getting the first instance of room available of the array for the reservation
      new_reservation = Reservation.new(date_range, room_to_reserve) 
      room_to_reserve.add_reservation(new_reservation)
      return new_reservation
    end

    # def lookup_reservation_by_date(date_range) 
    #     return
    # end

    def get_available_rooms(date_range) #list of rooms 
      rooms_available = []
      @rooms.each do |room|
        if room.check_availability(date_range)
          rooms_available << room 
        end     
      end 
      return rooms_available
    end


  end
end



