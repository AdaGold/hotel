require 'date'

require_relative 'reservation_manager'

module Hotel
  class Reservation

    attr_reader :room, :stay_begin, :stay_end, :cost

    def initialize(room, stay_begin, stay_end, cost = 200)
      @room = room
      @stay_begin = stay_begin
      @stay_end = stay_end
      @cost = (((stay_end - stay_begin).to_i / 24) - 1) * cost

      verify_date(@stay_begin, @stay_end)
    end

    def overlapping?(first, last)
      @stay_begin <= last && first <= @stay_end
    end
    
    private

    def verify_date(stay_begin, stay_end)
      if stay_begin - Date.today < 0
        raise ArgumentError.new("#{stay_begin} is before today. You cannot reserve a room for a past date.")
      elsif stay_begin - stay_end > 0
        raise ArgumentError.new("#{stay_end} is before #{stay_end}. The end date must be after the begin date.")
      end
    end
    
  end
end