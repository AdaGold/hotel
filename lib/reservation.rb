require "date"

module Hotel
  class Reservation
    attr_accessor :start_date, :end_date, :total_cost

    def initialize(start_date, end_date)
      @start_date = start_date
      @end_date = end_date
      @total_cost = total_cost

      if start_date >= end_date
        raise ArgumentError, "end date must be after start date. \
        Start date: #{start_date}, end date: #{end_date}"
      end
    end

    def total_nights
      return end_date - start_date
    end

    def total_cost
      # decouple this!!!!
      return Hotel::Room::ROOM_COST * total_nights
    end
  end
end
