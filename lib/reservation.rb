require 'date'
require_relative 'room'

module Hotel 
  class Reservation
    # Feel free to change this method signature as needed. Make sure to update the tests!
    def initialize(start_date, end_date, room) #room
      @start_date = start_date
      @end_date = end_date
      @room = room #each time that makes a reservation, creates an instance that is added in hotel controller reservations 
      
    end
  
    def cost 
      days = (@end_date - @start_date).to_i
      price = 200
      total_cost = days * price
      return total_cost
    end

    # def lookup_all_reservations_for_this_room 
    #   @room.lookup_reservations
    # end

  end
end

