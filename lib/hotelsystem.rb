module Hotel
  class HotelSystem
    attr_reader :rooms, :reservations

    def initialize
      @rooms = [*1..20]
      @reservations = reservations
    end

    def list_rooms
      return @rooms.map do |num|
               "Room ##{num}"
             end
    end

    ##### WIP ######
    def reserve_room
      return Reservation.new(start_date, end_date)
    end

    def current_reservations

      # return reservations array by date
    end
  end
end
