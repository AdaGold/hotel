require_relative 'date_range'

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
      @total_cost = ((@end_date - @start_date)-1) * 200
    end 

    def get_total_cost 
      return @total_cost
    end 

    def check_dates(start_date, end_date)
      # if Date.today - start_date > 0 
      #   raise ArgumentError.new("Invalid date, you can't start a reservation in the past")
      # elsif Date.today - end_date > 0 
      #   raise ArgumentError.new("Invalid date, you can't end a reservation in the past")
      # end 
    end 

  end 
end 