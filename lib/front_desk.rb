module Hotel
  class FrontDesk
    def initialize
      @all_rooms = []
      20.times do |i|
        @all_rooms << Hotel::Room.new("room #{i + 1}") #instantiate Room object
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
      raise(ArgumentError, "This room #{room} is unavailable for reservation for given dates #{start_date} - #{end_date}") unless list_of_availble_rooms(start_date, end_date).include? room 

      new_res = Hotel::Reservation.new(start_date, end_date, guest_name: guest_name, room: room)
      #raise an argumentErro when the start_date and/or the  end_date of a reservation for a room already exits aka if the room is not available for those dates

      reservation_room = @all_rooms.find do |room_object|
        room_object == room
      end
      #add reservation to room's reservation_list
      reservation_room.add_reservation_to_room(new_res)
      #add this reservation to all_reservations in hotel
      @all_reservations << new_res
    end

    #return an array of all Reservations with matching date requested
    def list_of_reservations(date)
      return @all_reservations.select do |reservation|
               reservation.reservation_dates.all_dates.any? do |day| #this has high time complexity so might change it?
                 date == day
               end
             end

      return
    end

    #returns an array of all available rooms for the give date range 
    def list_of_availble_rooms(start_date, end_date)
      reserved_rooms = @all_rooms.select do |room|
        room.dates_unavailable.any? (start_date...end_date)
      end
      return @all_rooms - reserved_rooms
    end
  end
end
