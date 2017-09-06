# require_relative 'reservation.rb'
# require_relative 'date_range.rb'
require 'date'
module Hotel
  class Hotel
    def initialize
      @rooms = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    end

    def rooms
      return @rooms
    end

  end #end of class
end #end of module
