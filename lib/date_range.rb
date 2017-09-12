require_relative 'hotel.rb'
require_relative 'reservation.rb'
require 'date'

module Hotel
  class DateRange
    attr_reader :room_number, :start_date, :end_date, :date

    def initialize(room_number, start_date, end_date)
      @start_date = start_date
      @end_date = end_date
      @room_number = room_number
      @date = (@end_date - @start_date)
    end

    def date
      return @date.to_i
    end
    
  end #end of class
end #end of module

# start_date = Date.new(2017,10,01)
# end_date = Date.new(2017,10,10)
# testing = Hotel::DateRange.new(3, start_date, end_date)