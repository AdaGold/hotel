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

    #refactoring 
    #combine dates_unavailable and is_available_during method so the method only outputs true or false depending on it's availability 
    def dates_unavailable
      dates_booked = @room_reservations.map do |reservation|
        reservation.reservation_dates.all_dates
      end
      return dates_booked.flatten
    end

    def is_available_during(start_date, end_date)
      test_date_range = (start_date...end_date).to_a
      if (dates_unavailable & test_date_range).length > 0
        return false
      else
        return true
      end
    end
  end
end
