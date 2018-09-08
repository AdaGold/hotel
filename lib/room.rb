module Hotel
  # create new class of Room, to create the block of rooms
  class Room
    attr_reader :room_number
    attr_accessor :status, :reservations

    def initialize(room_number, status = :Available)
      @room_number = room_number
      @status = status
      @reservations = []
    end

    def self.create_rooms
      @all_rooms = []
      room_number = 0
      20.times do
        room_number += 1
        @all_rooms << Room.new(room_number)
      end
      return @all_rooms
    end

    def list_all_rooms
      @all_rooms = all_rooms
    end

    def to_s
      "#{self.class} - #{self.object_id} - @room=#{self.room_number}, @status=#{self.status}"
    end
  end
end
