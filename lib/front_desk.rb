module Hotel
  class FrontDesk
    def initialize
      @all_rooms = []
      20.times do |i|
        @all_rooms << "#{i + 1}"
      end

      @all_reservations = []
    end

    #gives a copy of all rooms within the hotel
    def list_of_all_rooms
      return @all_rooms.clone 
    end

    #reserve a room by giving a date range, guest name, and which room to stay in 
    def reserve_room(start_date, end_date, guest_name, room)
      raise(ArgumentError, "This room #{room} does not exist in our hotel:(") unless @all_rooms.include? room
      @all_reservations << Hotel::Reservation(start_date, end_date, guest_name, room)
    end

    def list_of_reservations(date)
        @all_reservations.find_all do |reservation|
            reservation
        end
    end

    def list_of_availble_rooms(start_date, end_date)
    end
  end
end
