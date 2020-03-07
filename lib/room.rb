module Hotel
  class Room
    attr_reader :room_number, :room_reservations

    def initialize(room_number)
      @room_number = room_number
      @room_reservations = []
    end

    def add_reservation_to_room(reservation)
      raise(ArgumentError, "this reservation#{reservation} is not for #{@room_number}.") unless reservation.room == @room_number
      @room_reservations << reservation
    end

    #return an array of all the dates room was booked/is unavailable
    def dates_unavailable
      dates_booked = @room_reservations.map do |reservation|
        reservation.reservation_dates.all_dates
      end
      return dates_booked.flatten 
    end
  end
end
