module Hotel
  # create new class of Room, to create the block of rooms
  class Room
    attr_reader :room_number
    attr_accessor :status

    def initialize(room_number, status = :Available)
      @room_number = room_number
      @status = status
    end

    def self.create_rooms
      @all_rooms = []
      room_number = 0
      20.times do
        room_number += 1
        @all_rooms << Room.new(room_number)
      end
      @all_rooms
    end

    def self.list_all_rooms
      @all_rooms = self.create_rooms
    end
  end
end
