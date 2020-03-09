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
      return @all_rooms.select do |room|
               room.is_available_during(start_date, end_date)
             end
    end

    def reserve_room(start_date, end_date, guest_name:, room:)
      raise(ArgumentError, "This room #{room} does not exist in our hotel:(") unless @all_rooms.any? do |individual_room|
        individual_room.room_number == room
      end

      reservation_room = @all_rooms.find do |room_object|
        room_object.room_number == room
      end
      raise(ArgumentError, "This room #{room} is unavailable for reservation for given dates #{start_date} - #{end_date}") unless reservation_room.is_available_during(start_date, end_date)

      new_res = Hotel::Reservation.new(start_date, end_date, guest_name: guest_name, room: room)

      reservation_room.add_reservation_to_room(new_res)
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
