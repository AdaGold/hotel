require_relative "reservation"

module Hotel
  class HotelSystem
    attr_reader :rooms, :reservations

    def initialize(reservations = [])
      @rooms = [*1..20]
      @reservations = reservations
    end

    def list_rooms
      return @rooms.map do |num|
               "Room ##{num}"
             end
    end

    def reservations_by_date(date)
      return reservations.select do |booking|
               booking.in_date_range?(date)
             end
    end

    def available_rooms(date)
      days_reservations = reservations_by_date(date)
      occupied_rooms = days_reservations.map do |reservation|
        reservation.room
      end
      return @rooms - occupied_rooms
    end

    def reserve_room
      room = @rooms.sample
      return Reservation.new(start_date, end_date, room)
    end
  end
end
