module Hotel
  class FrontDesk
    def initialize
      @all_rooms = []
      20.times do |i|
        @all_rooms << Hotel::Room.new("room: #{i + 1}")
      end

      @all_reservations = []
    end

    #gives a copy of all rooms within the hotel
    def list_of_all_rooms
      return @all_rooms.clone
    end

    #reserve a room by giving a date range, guest name, and which room to stay in
    def reserve_room(start_date, end_date, guest_name, room)
      raise(ArgumentError, "This room #{room} does not exist in our hotel:(") unless @all_rooms.include? room
      
      new_res = Hotel::Reservation.new(start_date, end_date, guest_name: guest_name, room: Hotel::Room.new(room))
   #adding the new reservation to the total reservations array 
   #adding the new reservation to the list of that room's reservations 
   #### should the list of reservations of the hotel be accessible to the front desk or should this be happening in the room class 
   
      @all_reservations << new_res 
      :room.room_reservations << new_res

    end

    def list_of_reservations(date)
      return @all_reservations.find_all do |reservation|
               reservation.reservation_dates.all_dates.each do |day| #this has high time complexity so might change it?
                 date == day
               end
             end
    end

    def list_of_availble_rooms(start_date, end_date)


    end
  end
end
