require_relative 'reservation'

module Hotel
  class Room
    attr_reader :id

    def initialize(id)
      @id = id 
    end 

    

  end 
end 



# x = Room.new(2)
# x.add_reservation(start, end)

# class Room
#   def add_reservation 
#     self.reservations.push(Reservation.new(start,end, self))
#   end
# end