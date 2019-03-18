require_relative "reservation"

module Hotel
  class HotelSystem
    attr_reader :rooms, :reservations

    def initialize(reservations = [])
      @rooms = [*1..20]
      @reservations = reservations
    end

    def list_rooms
      room_list = @rooms.map do |num|
        "Room ##{num}"
      end
      return room_list
    end

    def reservations_by_date(date)
      reservations_by_date = reservations.select do |booking|
        booking.in_date_range?(date)
      end
      return reservations_by_date
    end

    def occupied_rooms(days_reservations)
      occupied_rooms = days_reservations.map do |reservation|
        reservation.room
      end

      return occupied_rooms
    end

    def occupied_rooms_list(start_date, end_date)
      rooms_occupied = []
      [*start_date...end_date].each do |date|
        if reservations_by_date(date)
          rooms_occupied << occupied_rooms(reservations_by_date(date))
        end
      end

      return rooms_occupied.flatten.uniq
    end

    def room_available?(start_date, end_date, room)
      return available_rooms_list(start_date, end_date).include?(room)
    end


    def reserve_room(start_date, end_date, room)
      if room_available?(start_date, end_date, room)
        reservation = Hotel::Reservation.new(start_date, end_date, room)
        @reservations << reservation
        return reservation
      end
    end

    def available_rooms_list(start_date, end_date)
      until invalid_dates?(start_date, end_date)
        rooms_occupied = occupied_rooms_list(start_date, end_date)

        return @rooms - rooms_occupied
      end
    end

    private
    def is_date?(date)
      return date.class == Date
    end

    def invalid_dates?(start_date, end_date)
      return start_date > end_date || !is_date?(start_date) || !is_date?(end_date)
    end
  end
end
