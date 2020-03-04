module Hotel
  class Reservation
    attr_reader :date_range
    # Feel free to change this method signature as needed. Make sure to update the tests!
    def initialize(start_date, end_date, room_number)
      @date_range = DateRange.new(start_date, end_date)
      @room_number = room_number
    end
    
  #get the total cost for a given reservation
    def cost
      return @date_range.nights * 200
    end
  end
end
