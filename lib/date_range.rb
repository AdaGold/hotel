module Hotel
  class DateRange
    attr_accessor :start_date, :end_date

    def initialize(start_date, end_date)
      if end_date <= start_date
        raise ArgumentError, "end_date must be after_start_date"
      end

      @end_date = end_date
      @start_date = start_date
    end

    def overlap?(other)
      # other is contained or the same
      if other.end_date <= end_date && other.start_date >= start_date
        return true
      # other is completely before
      elsif other.end_date <= start_date
        return false
      # other is complete after
      elsif other.start_date >= end_date
        return false
      #overlaps beginning or end
      else
        return true
      end
    end

    def include?(date)
      if start_date <= date && date < end_date
        return true
      else
        return false
      end
    end

    def nights
      return end_date - start_date
    end
  end
end
