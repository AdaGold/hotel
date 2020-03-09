require "date"

module Hotel
  class DateRange
    attr_reader :start_date, :end_date

    def initialize(start_date, end_date)
      raise(ArgumentError, "The end date #{end_date} is smaller or same as the start date #{start_date}.") unless end_date > start_date
      @start_date = start_date
      @end_date = end_date
    end

    #for future refactoring- does_match_date(date)
    #this method will elaborate on the current method so it takes a date and returns a true or flase depending on if that date exists/overlaps all the days in the date range 
    def all_dates
      return (@start_date...@end_date).to_a
    end

    def duration
      return all_dates.length
    end
  end
end
