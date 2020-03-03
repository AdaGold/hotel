require_relative 'reservation'
require_relative 'hotel'

module HotelSystem
  class Room 
    attr_reader :room_number, :cost_per_night
    attr_accessor :reservations

    def initialize(room_number, cost_per_night, reservations=[])
      @room_number = room_number
      @cost_per_night = cost_per_night
      @reservations = [] 
    end 

    def add_reservation(reservation)
      @reservations << reservation
    end

  
  end 

end 

def main 
  #res1 = HotelSystem::Reservation.new(1, Date.today, Date.new(2020,03,29))
  #res2 = HotelSystem::Reservation.new(2, Date.new(2020, 03, 29), Date.new(2020, 04,02))
  #res3 = HotelSystem::Reservation.new(3, Date.new(2020, 04, 06), Date.new(2020,04,18))


  #hotel = HotelSystem::Hotel.new 
 
  #hotel.add_reservation(1, HotelSystem::Reservation.new(1, Date.today, Date.new(2020,03,29)))
  # hotel.rooms[1].add_reservation(res2)
  # hotel.rooms[1].add_reservation(res3)
  #hotel.to_s

  #array = hotel.find_reservations_with_date(2, Date.new(2020, 03, 18), Date.new(2020, 04, 02))

  #puts array.to_s

end 

main 