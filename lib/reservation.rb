module Hotel
  class Reservation
    attr_reader :room, :guest_name
    #start and end date are positional arguments- their position is important but room (string) and guest name can be keyword arguments
    def initialize(start_date, end_date, room:, guest_name:)
      @start_date = start_date
      @end_date = end_date
      @room = room
      @guest_name = guest_name.to_s
    end

    #instantiate DateRange with the given start and end date
    def reservation_dates
      return Hotel::DateRange.new(@start_date, @end_date)
    end

    #call for how many nights (duration method in DateRange) to calculate the total cost
    def cost
      return reservation_dates.duration * 200
    end
  end
end
