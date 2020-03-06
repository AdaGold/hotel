module Hotel
  class DateRange
    attr_accessor :start_date, :end_date

    def initialize(start_date, end_date)
      # if start date is on or after end Date, raise exception
      if start_date >= end_date
        raise ArgumentError, " Invalid Date Range."
      
      end
      
      @start_date = start_date
      @end_date = end_date
    end
    # check if date selected overlaps with the date_range
    def overlap?(new_start_date, new_end_date)
      return(start_date <= new_end_date && end_date >= new_start_date) 
    end
    # check if new_date is between start_date and end_date
    def include?(new_date)
      return start_date <= new_date && end_date > new_date
    end

    def nights
      return end_date - start_date
    end
  end
end
