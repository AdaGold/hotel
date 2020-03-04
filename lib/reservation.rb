require 'date'

module HotelSystem
  class Reservation 
    attr_reader :start_date, :end_date, :total_cost 
    attr_accessor :reservation_number

    def initialize(reservation_number, start_date, end_date)
      @reservation_number = reservation_number
      check_dates(start_date, end_date)
      @start_date = start_date
      @end_date = end_date
      @total_cost = ((@end_date - @start_date)) * 200
    end 

    def get_total_cost 
      return @total_cost
    end 

    def check_dates(start_date, end_date)
      if Date.today > start_date || Date.today > end_date
        raise ArgumentError.new("Invalid date, you can't start or end a reservation in the past")
      end 
    end 

    def reservation_in_progress
      #TODO 

    end 




  end 
end 