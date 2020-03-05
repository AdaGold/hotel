require "date"

module Hotel
  class DateRange
    attr_reader :start_date, :end_date

    def initialize(start_date, end_date)
      raise(ArgumentError, "The end date #{end_date} is smaller or same as the start date #{start_date}.") unless end_date > start_date
      @start_date = start_date
      @end_date = end_date
    end

    #return an array of all the dates within the range- excluding the last day aka the day the guest leaves
    def all_dates
      return (@start_date...@end_date).map do |date|
               date
             end
    end

    def duration
      return all_dates.length
    end

    
  end
end
