require_relative 'hotel.rb'
require_relative 'date_range.rb'
require 'date'

module Hotel
  class Reservation
    attr_reader :date, :room_availability, :reservation

    def initialize(room_number, check_in, check_out)
      @date = DateRange.new(room_number, check_in, check_out).date
      @room_availability = {}
    end

    def price_night
      return 200
    end

    def total_cost
      return price_night * date
    end

    def reservation
      return @reservation
    end

  end #end of class
end #end of module