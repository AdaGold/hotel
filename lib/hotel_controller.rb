module Hotel
  class HotelController
    # Wave 1
    attr_reader :reservations, :rooms
    
  # I can access the list of all of the rooms in the hotel
    def initialize
      @reservations = []
      @rooms = [] #create a list of rooms
    
      room_number = 1
      20.times do # 20 rooms from requirements
        #20 times... do...
        @rooms << room_number
        room_number = room_number + 1
      end
    end
# access the list of reservations for a specified room and a given date range
    def list_reservations_for_room(room, start_date, end_date)
      list = [] # returns an array of reservations that falls within the date range
      @reservations.each do |reservation|
        if room == reservation.room_number
          if reservation.date_range.overlap?(start_date, end_date)
           list << reservation
          end
        end
      end
      return list
    end

    def reserve_room(start_date, end_date)
      # start_date and end_date should be instances of class Date
      # looks through room numbers and get reservations for the date in question until we find one with no reservations
      available = find_available_rooms(start_date, end_date)

      # check for available rooms
      if available.length > 0
        newly_created_reservation = Reservation.new(start_date, end_date, available[0])
        reservations << newly_created_reservation
        return newly_created_reservation
      else
        raise ArgumentError, "No available rooms."
      end
    end
  # access the list of reservations for a specific date,
  # so that I can track reservations by date
    def show_reservations_for_date(date)
      # go through reservations and add the ones whose range include the given date
      list = []
      @reservations.each do |reservation|
        if reservation.date_range.include?(date)
          list << reservation
        end
      end
      return list
    end

    # Wave 2
    def find_available_rooms(start_date, end_date)
      # start_date and end_date should be instances of class Date
      available_rooms = []
      # iterate through the rooms to find available room 
      @rooms.each do |room|
        reservations = list_reservations_for_room(room, start_date, end_date)
  
        if(reservations.length() == 0) # rooms that are empty
          available_rooms << room
        end
      end
      return available_rooms
    end
  end
end