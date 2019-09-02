module Hotel
  class Reservation
    
    attr_reader :start_date, :end_date, :room

    def initialize(start_date, end_date, room)
      @start_date = start_date
      @end_date = end_date
      @room = room
      @range = Hotel::DateRange.new(start_date, end_date)
    end

    def cost
      return @range.nights*Hotel::HotelController.new.cost
    end
  end
end
