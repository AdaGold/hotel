module Hotel
  class HotelSystem
    attr_reader :rooms, :reservations

    def initialize
      @rooms = [*1..20]
      @reservations = reservations
    end

    def list_rooms
      return @rooms.map do |num|
               "Room ##{num}"
             end
    end
  end
end
