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
      list = []
      @reservations.each do |reservation|
        if room == reservation.room_number
          if reservation.date_range.overlap?(start_date, end_date)
           list.add(reservation)
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
        return Reservation.new(start_date, end_date, available[0])
      else
        raise ArgumentError "No rooms available."
      end
    end
  # access the list of reservations for a specific date,
  # so that I can track reservations by date
    def show_reservations_for_date(date)
      # go through reservations and add the ones whose range include the given date
      list = []
      @reservations.each do |reservation|
        if reservation.date_range.include?(date)
          list.add(reservation)
        end
      end
      return list
    end

    # Wave 2
    def find_available_rooms(start_date, end_date)
      # start_date and end_date should be instances of class Date
      rooms = []
      room_number = 1
      while room_number <= 20
        reservations = list_reservations_for_room(start_date, end_date, room_number)
      
        if (reservations.length() == 0) # rooms that are empty
          rooms << room_number
        end

        room_number += 1
      end

      return rooms
    end
  end
end