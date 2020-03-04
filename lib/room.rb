
require 'awesome_print'

module HotelSystem
  class Room
    
    attr_accessor :reservations,:room_number, :cost_per_night

    def initialize(room_number, cost_per_night, reservations=[])
      @room_number = room_number
      @cost_per_night = cost_per_night
      @reservations = reservations
    end 

    def add_reservation(reservation)
      @reservations << reservation
    end

    def list_reservations 
      ap @reservations
    end 
    #this method only looks at the very last reservation 
    def is_room_available?(start_date, end_date)
      return is_between_two_dates([start_date, end_date], @reservations.last.end_date) #&& is_between_two_dates([start_date, end_date], @reservations.last.start_date)   
      
    end 

    private 

    def is_between_two_dates(range_wanted, date)
      return date >= range_wanted[0] && date <= range_wanted[1];
    end 
  
  end 

end 

