require_relative 'room.rb'
# require_relative 'reservation.rb'
# require_relative 'hotel_admin.rb'

module Hotel
  class Admin
    attr_accessor :rooms
    def initialize
      @rooms = Hotel::Room.create_rooms
    end

    def self.check_room_status
      @booked_rooms = []
      @open_rooms = []
      @rooms.each do |number, status|
        if :room_status == :Available
          status = :Unavailable
          @booked_rooms << room
        elsif :room_status == :Available
          @open_rooms << room
        end
        @booked_rooms
        @open_rooms
      end
    end
  end


end
