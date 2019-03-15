require "date"

module Hotel
  class Reservation
    attr_accessor :start_date, :end_date, :total_cost, :room

    ROOM_COST = 200 # identical rooms at $200/night

    def initialize(start_date, end_date, room)
      @start_date = start_date
      @end_date = end_date
      @room = room

      if !@room.to_s.match /\d+/
        raise ArgumentError, "Invalid Room Number"
      end

      if start_date >= end_date
        raise ArgumentError, "end date must be after start date. \
        Start date: #{start_date}, end date: #{end_date}"
      end
    end

    def total_cost
      return ROOM_COST * total_nights
    end

    def total_nights
      return end_date - start_date
    end

    def in_date_range?(date)
      if date.is_a?(Date)
        return date >= start_date && date < end_date
      else
        false
      end
    end
  end
end
