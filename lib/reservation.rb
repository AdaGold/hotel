require 'date'

module Hotel 
  class Reservation
    # Feel free to change this method signature as needed. Make sure to update the tests!
    def initialize(start_date, end_date, room: nil)
      @start_date = start_date
      @end_date = end_date
      @room = room 
    end
  
    def cost 
      days = (@end_date - @start_date).to_i
      price = 200
      total_cost = days * price
      return total_cost
    end

  end
end

