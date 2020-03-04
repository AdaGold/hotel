require 'date'
require_relative 'date_range'

module Hotel 
  class Reservation
    attr_reader :id, :date_range, :room, :cost
    def initialize(date_range, room) #room
      @date_range = date_range
      @room = room #each time that makes a reservation, creates an instance that is added in hotel controller reservations 
      
    end
  
    def cost 
      price = 200
      total_cost = @date_range.nights * price 
      return total_cost 
    end

  end
end


 # def lookup_all_reservations_for_this_room 
    #   @room.lookup_reservations
    # end


   