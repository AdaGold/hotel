require 'Date'
module Reservation
  class ReserveRoom
    attr_accessor :room_status, :start_date, :end_date, :cost

    def initialize(input)
      @room_status = :room_status
      @start_date = input[:start_date]
      @end_date = input[:end_date]
      @cost = cost 
    end

    def start_date
      @start_date = start_date
    end
    def end_date
      @end_date = end_date
    end

    def create_reservation

    end

    def check_room_status

    end
end
    class BookingDates

    end
