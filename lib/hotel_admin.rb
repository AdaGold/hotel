require_relative 'room.rb'
require_relative 'reservation.rb'
require_relative 'hotel_admin.rb'

module Hotel
  class Admin
    def initialize
      @rooms = Hotel::Room.create_rooms
    end
  end

  def create_reservation
    @booked_rooms = []
    @open_rooms = []
    @all_rooms.each do |number, status|
      if :room_status == :Available
        status = :Unavailable
        booked_rooms << room
      end
    end
  end


end
