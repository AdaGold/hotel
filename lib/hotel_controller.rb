module Hotel
  class HotelController
    # Wave 1
    attr_reader :rooms, :cost, :reservation_list
    def initialize
      @rooms = (1..20).to_a
      @cost = 200
      @reservation_list = []
    end

    def reserve_room(start_date, end_date)
      # start_date and end_date should be instances of class Date
      reservation = Reservation.new(start_date, end_date, @rooms.sample)
      @reservation_list << reservation
      return Reservation.new(start_date, end_date, @rooms.sample)
    end

    def reservations(date)
      reservations = []
      @reservation_list.each do |reservation|
        date_range = Hotel::DateRange(reservation.start_date, reservation.end_date)
        if date_range.include(date)
          reservations << reservation
        end
      end
      return reservations
    end

    # Wave 2
    def available_rooms(start_date, end_date)
      # start_date and end_date should be instances of class Date
      return []
    end
  end
end
