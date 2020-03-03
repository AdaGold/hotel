require_relative 'reservation'

module HotelSystem
  class Room
    attr_reader :room_number, :cost_per_night
    attr_accessor :reservations

    def initialize(room_number, cost_per_night)
      @room_number = room_number
      @cost_per_night = cost_per_night
      @reservations = [] #[[s ,e ]], [s, e], [s,e]]
    end 

    def add_reservation(reservation)
      @reservations << reservation
    end 
    

  end 

end 