require_relative 'room'
#require_relative 'reservation'

module HotelSystem 
  class Hotel 
    attr_accessor :rooms
   
    def initialize
      @rooms = create_rooms
    end 
    

    def find_reservations_with_date(room_number, start_date, end_date)
      #TODO find a parse method  dates 
      room = find_room(room_number)
      reservs = []
      room.reservations.each do |reservation|
        if start_date - reservation.end_date < 0 
          reservs << reservation
        elsif end_date - reservation.end_date < 0 
          reservs << reservation
        else 
          ###########
        end 
      end 
      return reservs
    end 

    def get_all_rooms
      @rooms.each do |room|
        puts room
      end 
    end 
    
    def find_room(room_number)
      @rooms.each do |room| 
        if room_number == room.room_number 
          return room
        end 
      end
    end

    private

    def create_rooms
      rooms = []
      20.times do |i|
        rooms << HotelSystem::Room.new(i+1, 200)
      end 
      return rooms
    end 
    
    
  end 
end 

def main
  hotel = HotelSystem::Hotel.new 
  hotel.get_all_rooms



end 

main


