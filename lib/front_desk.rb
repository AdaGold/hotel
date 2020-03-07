module Hotel
  class FrontDesk
    attr_reader :all_rooms, :all_reservations

    def initialize
      @all_rooms = []
      20.times do |i|
        @all_rooms << Hotel::Room.new("room #{i + 1}") #instantiate Room object
      end

      @all_reservations = []
    end

    def list_of_available_rooms(start_date, end_date)
      test_date_range = (start_date...end_date).to_a
      return @all_rooms.reject do |room|
               (room.dates_unavailable & test_date_range).length > 0
             end
    end

    def reserve_room(start_date, end_date, guest_name:, room:)
        given_date_range = (start_date...end_date).to_a
      raise(ArgumentError, "This room #{room} does not exist in our hotel:(") unless @all_rooms.any? do |individual_room|
        individual_room.room_number == room
      end
      

      
      reservation_room = @all_rooms.find do |room_object|
        room_object.room_number == room
      end
      raise(ArgumentError, "This room #{room} is unavailable for reservation for given dates #{start_date} - #{end_date}") unless (reservation_room.dates_unavailable & given_date_range).length == 0
      #raise an argumentErro when the start_date and/or the  end_date of a reservation for a room already exits aka if the room is not available for those dates


      new_res = Hotel::Reservation.new(start_date, end_date, guest_name: guest_name, room: room)
      #add reservation to room's reservation_list
      reservation_room.add_reservation_to_room(new_res)

      #add this reservation to all_reservations in hotel
      @all_reservations << new_res
      
      return new_res
    end

    def list_of_reservations(date)
      return @all_reservations.select do |reservation|
               reservation.reservation_dates.all_dates.any? do |day|
                 date == day
               end
             end
    end
  end
end
