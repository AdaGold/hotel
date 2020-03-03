require_relative 'reservation'
require_relative 'room'
require_relative 'date_range'
module Hotel
  class HotelController

    #Hotel controller makes the reservation using the attributes of reservation class 
    attr_reader :rooms, :reserve_room, :reservations, :available_rooms
    def initialize
      @rooms = Array.new(20) { |i| Room.new(i) } 
      
      @reservations = []
    end
      # You might want to replace this method with an attr_reader
      
    def reserve_room(start_date, end_date, room_number)
      # start_date and end_date should be instances of class Date
      #return Reservation.new(start_date, end_date, nil)
      # @rooms[0].add_reservation(Reservation.new(start_date, end_date, @rooms[0]))
    end

    def reservation_by_date(date) #list of reserved rooms when given a date 
      @reservations
    end

    # Wave 2
    def available_rooms(start_date, end_date)
      # start_date and end_date should be instances of class Date
      return []
    end
  end
end

#HotelController.reserve_room("jan 7", "jan 10", 1)