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

    def reserve_room
      return Reservation.new(start_date, end_date)
    end

    def reservations_by_date(date)
      return reservations.select do |booking|
               date >= booking.start_date && date < booking.end_date
             end
    end
  end
end
