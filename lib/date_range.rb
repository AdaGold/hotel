require_relative 'hotel_controller'
require 'date'

module Hotel 
  class DateRange
    attr_accessor :start_date, :end_date 

    def initialize(start_date, end_date)
      @start_date = start_date
      @end_date = end_date
      raise ArgumentError.new("date range is incorrect") if @start_date > @end_date || @start_date == @end_date
    end
    
    def overlap?(second_date_range) 
      if second_date_range.start_date >= @end_date || second_date_range.end_date <= @start_date
        return false 
      else 
        return true 
      end 
    end

    def include_date_range?(date_range)
      date_range.start_date.between?(@start_date, @end_date) || date_range.end_date.between?(@start_date, @end_date)
    end   

    def nights
      return (@end_date - @start_date).to_i 
    end

  end
end