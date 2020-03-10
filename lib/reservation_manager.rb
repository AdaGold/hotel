require 'date'

require_relative 'block'

# require_relative 'reservation'
# require_relative 'room'

module Hotel
  class ReservationManager

    attr_reader :rooms

    def initialize
      @rooms = create_rooms
    end

    def new_reservation(first, last)
      available_rooms = @rooms.select { |room| room.available?(first, last)}
      if available_rooms.length == 0
        raise ArgumentError.new "There are no available rooms to book!"
      end

      reservation = Reservation.new(available_rooms[0], first, last)
      available_rooms[0].reservations << reservation
    end

    def new_block(rooms, block_begin, block_end, rate)
      if rooms.length > 5
        raise ArgumentError.new("#{rooms.length} is more than the maximum number of allowed rooms for a block.")
      end

      rooms.each do |room|
        if !room.available?(block_begin, block_end)
          raise ArgumentError.new("Room #{room.number} is not available for the dates #{block_begin} - #{block_end}.")
        end
      end

      block = Hotel::Block.new(rooms, block_begin, block_end, rate)

    end

    def reserve_block_room(block, stay_begin, stay_end)
      block.reserve_room(stay_begin, stay_end)
    end

    def all_reservations_by_room(num, first, last)
      room = @rooms.select { |room| room.number == num}

      matching_reservations = room[0].reservations.select { |reservation| reservation.overlapping?(first, last)}

      return matching_reservations
    end

    def all_reservations_by_date(first, last)
      matching_reservations = []

      @rooms.each do |room|
        matches = room.reservations.select { |reservation| reservation.overlapping?(first, last)}
        matches.each do |match|
          matching_reservations << match
        end
      end

      return matching_reservations
    end

    def rooms_list
      list = ""
      @rooms.each do |room|
        list += "Room Number: #{room.number}\n"
      end
      return list
    end

    def room_list_by_availability(first, last)
      available_rooms = @rooms.select { |room| room.available?(first, last)}

      return available_rooms
    end

    private

    def create_rooms
      rooms = []
      20.times do |i|
        rooms << Hotel::Room.new(i + 1)
      end
      return rooms
    end
  end
end