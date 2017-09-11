require_relative 'reservation.rb'
require_relative 'date_range.rb'
require 'date'
module Hotel
  class Hotel
    attr_reader :reservation

    def initialize
      @rooms = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
      @reserved_rooms = []
      @reservation = {}
    end

    def collection_rooms
      return @rooms
    end

    def collection_reservation
      return "{@reservation}"
    end

    def check_if_reserved(room_number)
      @reservation.each do |key, value|
        if key == room_number && value[0] > 0
          return true
        else
        end
      end
      return false
    end

    # def available_rooms
    #   @reserved_rooms.each do |i|
    #     checker = @reserved_rooms[i]
    #     @rooms.each do |x|
    #       if @rooms[x] == checker
    #         @rooms[i - 1] = 0
    #       end
    #     end
    #   end
    # end
  end #end of class
end #end of module
