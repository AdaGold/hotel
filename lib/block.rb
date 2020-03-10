require 'date'

require_relative 'reservation'
require_relative 'room'

module Hotel
  class Block < Reservation

    attr_reader :rooms, :rate

    def initialize(rooms, stay_begin, stay_end, rate)
      super(room, stay_begin, stay_end, rate)

      @rooms = rooms.to_h { |room| [room, false]}
      @rate = rate

      claim_rooms
    end

    def any_available?
      available_rooms = @rooms.select { |room, bool| bool == false}
      if available_rooms.length > 0
        return true
      else
        return false
      end
    end

    def reserve_room(first, last)

      if first != @stay_begin || last != @stay_end
        raise ArgumentError.new "#{first} - #{last} is not a valid date range!"
      end
      
      available_rooms = @rooms.reject { |room, bool| bool == true}
      if available_rooms.length == 0
        raise ArgumentError.new("There are no rooms in the block available to book!")
      else
        @rooms[available_rooms.keys.first] = true
      end

    end

    private

    def claim_rooms
      @rooms.each do |room, bool|
        reservation = Hotel::Reservation.new(room, @stay_begin, @stay_end, @cost)
        room.reservations << reservation
      end
    end

  end
end