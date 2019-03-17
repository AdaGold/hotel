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

    def occupied_rooms(date)
      days_reservations = reservations_by_date(date)
      occupied_rooms = days_reservations.map do |reservation|
        reservation.room
      end

      return occupied_rooms
    end

    def available_rooms(date)
      return @rooms - occupied_rooms(date)
    end

    def reserve_room(start_date, end_date)
      room = @rooms.sample
      return Reservation.new(start_date, end_date, room)
    end
  end
end
