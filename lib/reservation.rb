module Hotel
    class Reservation 
        attr_reader :room, :guest_name
        #start and end date are positional arguments- their position is important but room (string) and guest name can be keyword arguments
        def initialize(start_date, end_date, room:, guest_name:)
            @start_date = start_date
            @end_date = end_date
            @room = Hotel::Room.new(room)
            @guest_name = guest_name.to_s
        end
        
        def reservation_dates
            #instantiate DateRange with the given start and end date 
            return Hotel::DateRange.new(@start_date, @end_date)
        end

        def cost 
            #call for how many nights (duration method in DateRange) to calculate the total cost
            return reservation_dates.duration * 200
        end

        
    end
end