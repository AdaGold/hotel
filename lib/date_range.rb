
  class DateRange
    attr_reader :start_date, :end_date

    def initialize(start_date_str, end_date_str) # give it Date.parse(year-month)
      @start_date = Date.parse(start_date_str)
      @end_date = Date.parse(end_date_str)
    end

    def with_in_range?(date)
      return date >= start_date && date < end_date
    end

    def duration
      # to get duration subtract the two dates
      return end_date - start_date
    end

    def self.overlap?(date_range1, date_range2)
      if date_range1.end_date <= date_range2.start_date || date_range1.start_date >= date_range2.end_date
        return false
      else
        return true
      end
      # if date_range1.start_date <= date_range2.start_date && date_range1.end_date >= date_range2.end_date
      #   return true
      # elsif date_range1.start_date < date_range2.end_date && date_range1.start_date >= date_range2.start_date
      #   return true
      # elsif date_range1.end_date >date_range2.start_date && date_range1.end_date <= date_range2.end_date
      #   return true
      # else
      #   return false
      # end

    end
  end

