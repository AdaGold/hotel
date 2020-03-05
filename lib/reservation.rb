module Hotel
  class Reservation
    attr_reader :date_range, :start_date, :end_date, :room_number
   
    # initizlize 
    def initialize(start_date, end_date, room_number)
      @date_range = DateRange.new(start_date, end_date)
      @room_number = room_number
      @start_date = start_date
      @end_date = end_date
    end
    
  # get the total cost for a given reservation
    def cost
      return @date_range.nights * 200
    end
  end
end
