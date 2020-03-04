require_relative 'hotel_controller'
require 'date'

#date range is checking if start date 
#overlap if 20 rooms are booked for the start date - if 

module Hotel 
  class DateRange
    attr_accessor :start_date, :end_date

    def initialize(start_date, end_date)
      @start_date = start_date
      @end_date = end_date
    end

    def overlap?(other)
      
      return false
    end

    def include?(date)
      return false
    end

    def nights
      return (@end_date - @start_date).to_i 
    end
  end
end