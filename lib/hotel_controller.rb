module Hotel
  class HotelController
    # Wave 1
    attr_reader :reservation, :rooms
    
 
    def initialize(number_of_rooms)
      @reservation = []
      @rooms = [] #create a list of rooms
    
      number_of_rooms.times do |room|
        #20 times... do...
        @rooms << room
      end
        
    end

    def rooms
      # You might want to replace this method with an attr_reader
      return []
    end

    def reserve_room(start_date, end_date)
      # start_date and end_date should be instances of class Date
      # check for available rooms
      return Reservation.new(start_date, end_date, nil)
    end

    def reservations(date)
      return []
    end

    # Wave 2
    def available_rooms(start_date, end_date)
      # start_date and end_date should be instances of class Date
      return []
    end
  end
end
