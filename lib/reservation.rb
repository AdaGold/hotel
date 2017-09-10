require_relative 'hotel.rb'
require_relative 'date_range.rb'
require 'date'

module Hotel
  class Reservation

    def initialize(room_number, check_in, check_out)
      @date = DateRange.new(room_number, check_in, check_out).date
      @room_availability = {}
    end

  end #end of class
end #end of module