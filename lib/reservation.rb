module Hotel
  class Reservation
    attr_reader :room, :guest_name
    def initialize(start_date, end_date, room:, guest_name:)
      @start_date = start_date
      @end_date = end_date
      @room = room
      @guest_name = guest_name.to_s
    end
 
    def reservation_dates
      return Hotel::DateRange.new(@start_date, @end_date)
    end

    def cost
      return reservation_dates.duration * 200
    end
  end
end
