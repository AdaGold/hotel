require "date"

module Hotel
  class DateRange
    attr_reader :start_date, :end_date

    def initialize(start_date, end_date)
      raise(ArgumentError, "The end date #{end_date} is smaller or same as the start date #{start_date}.") unless end_date > start_date
      @start_date = start_date
      @end_date = end_date
    end

    def duration
      total_duration = (@end_date - @start_date).to_i
      total_duration -= 1
      return total_duration
    end

    def all_dates
      return (@start_date...@end_date).map do |date|
               date
             end
    end

    def overlap?(another_date_range)
      return false
    end
  end
end
