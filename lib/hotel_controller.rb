require_relative 'reservation'
module Hotel
  class HotelController

    #Hotel controller makes the reservation using the attributes of reservation class 
    attr_reader :rooms, :reserve_room, :reservations, :available_rooms

    # Wave 1
    def rooms
      rooms = Array.new(20) { |i| i += 1 }
      return rooms 
    end 
      # You might want to replace this method with an attr_reader
      
    def reserve_room(start_date, end_date)
      # start_date and end_date should be instances of class Date
      return Reservation.new(start_date, end_date, nil)
    end

    def reservations(date) #list of reserved rooms when given a date 
      return []
    end

    # Wave 2
    def available_rooms(start_date, end_date)
      # start_date and end_date should be instances of class Date
      return []
    end
  end
end
