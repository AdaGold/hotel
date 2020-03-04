module Hotel
    class Room 
        attr_reader :room_number 
        attr_accessor :room_reservations
        def initialize (room_number)
            @room_number = room_number
            @room_reservations = []
        end

        def dates_unavailable
            @room_reservations.reservation_dates.all_dates.each 
        end


    end
end