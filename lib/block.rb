require 'date'

require_relative 'reservation'
require_relative 'room'

module Hotel
  class Block < Reservation

    attr_reader :rooms, :rate

    def initialize(rooms, stay_begin, stay_end, rate)
      super(room, stay_begin, stay_end, rate)

      @rooms = rooms.to_h { |room| [room, nil]}
      @rate = rate

      claim_rooms
    end

    def any_available?
      available_rooms = @rooms.select { |room, bool| bool == nil}
      if available_rooms.length > 0
        return true
      else
        return false
      end
    end

    def reserve_room(first, last, preferred_room: nil)
      unless preferred_room == nil
        available_rooms = @rooms.select { |room, bool| bool == nil}
        if available_rooms.length == 0
          raise ArgumentError.new("There are no rooms in the block available to book!")
        else
          available_rooms.first.value = true 
        end
      end

      if @rooms[preferred_room] == nil
        @rooms[preferred_room] = true
      else
        raise ArgumentError.new("Room #{preferred_room.number} is not available to book!")
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