module Hotel
  class HotelController
    # Wave 1
    attr_reader :rooms, :cost, :reservation_list
    def initialize
      @rooms = (1..20).to_a
      @cost = 200
      @reservation_list = []
    end

    def reserve_room(start_date, end_date, room)
      available_rooms = get_available_rooms(start_date, end_date)
      unless available_rooms.include?(room)
        raise ArgumentError, "That room is not available"
      end

      reservation = Reservation.new(start_date, end_date, room)
      @reservation_list << reservation
      return reservation
    end

    def get_reservations(date)
      reservations = []
      @reservation_list.each do |reservation|
        date_range = Hotel::DateRange.new(reservation.start_date, reservation.end_date)
        if date_range.include?(date)
          reservations << reservation
        end
      end
      return reservations
    end

    # Wave 2
    def get_available_rooms(start_date, end_date)
      available_rooms = rooms
      date = start_date
      while date < end_date
        reservations = get_reservations(date)
        reservations.each do |reservation|
          available_rooms.delete(reservation.room)
        end
        date += 1
      end
      return available_rooms
    end
  end
end
