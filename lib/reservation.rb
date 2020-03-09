require 'date'
require_relative 'date_range'

module Hotel 
  class Reservation
    attr_reader :date_range, :room, :price, :cost, :hotel_block 
    def initialize(date_range, room, price = 200, hotel_block = :no) 
      @date_range = date_range
      @room = room 
      @price = price 
      @hotel_block = hotel_block 

      if @hotel_block == :yes 
        @price = 180 
      end 
      
      valid_block = [:yes, :no]
      raise ArgumentError if !valid_block.include?(@hotel_block)
    end
  
    def cost 
      total_cost = @date_range.nights * @price 
      return total_cost 
    end

  end
end

   