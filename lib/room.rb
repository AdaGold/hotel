require_relative 'reservation'
require_relative 'date_range'

module Hotel
  class Room
    attr_reader :id, :reservations
    
    def initialize(id, reservations = [])
      @id = id
      @reservations = []
    end 
    
    def check_availability(date_range) # is available?  #giving a date range to room and check if room is available for that day 
      @reservations.each do |r|
        if r.date_range.overlap?(date_range) 
          return false 
        end 
      end 
      return true 
    end 
    
    def add_reservation(reservation) 
      @reservations << reservation
    end 
  end 
end 



