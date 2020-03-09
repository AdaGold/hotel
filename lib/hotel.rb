require_relative 'room'
require_relative 'reservation'

module HotelSystem 
  class Hotel 
    attr_accessor :rooms

    def initialize
      @rooms = [] 
      20.times do |i|
        @rooms << HotelSystem::Room.new(i+1, 200)
      end 
    end 
    #the block can only be the last 5 rooms 15-20
    # def make_reservation_block(start_date, end_date, rooms_numbers, rate)
    #   rooms = []
    #   rooms_numbers.each do |num|
    #     if num > 20 || num < 15
    #       raise ArgumentError.new("you can only reserve rooms 15-20 for a block reservation")
    #     end 
    #     rooms << find_room(num)
    #   end 
      
    #   rooms.each do |room|
    #     room.cost_per_night = cost_with_discount(rate, room)
    #     make_reservation(room.room_number, start_date, end_date)
    #   end
    # end 
    
    def find_reservations_with_room_number(room_number, start_date, end_date)
      room = find_room(room_number)
      list_reservations = []
        room.reservations.each do |reservation|
          if is_between_two_dates([start_date, end_date], reservation.start_date) || is_between_two_dates([start_date, end_date], reservation.end_date) 
            list_reservations << reservation
          end
        end 
      return list_reservations
    end 

    def list_reservations_dates(start_date, end_date) 
      list_reservations = []
      @rooms.each do |room|
        room.reservations.each do |reservation|
          if is_between_two_dates([start_date, end_date], reservation.start_date) || is_between_two_dates([start_date, end_date], reservation.end_date) 
            list_reservations << reservation
          end 
        end 
      end  
      return list_reservations
    end 
    
    def find_room(room_number)
      @rooms.each do |room| 
        if room_number == room.room_number 
          return room
        end 
      end
    end

    def find_reservation(reservation_number)
      @rooms.each do |room|
        room.reservations.each do |reservation|
          if reservation.reservation_number == reservation_number
            return reservation
          end 
        end 
      end
    end 

    def total_cost(reservation_number)
      return find_reservation(reservation_number).total_cost
    end 

    def available_rooms(start_date, end_date) 
      list_rooms = []
      @rooms.each do |room|
          if room.reservations.length == 0 || room.reservations == nil 
            list_rooms << room 
          elsif no_shared_days?(start_date, end_date, room.reservations.last) === true 
            list_rooms << room
          end 
        end  
      return list_rooms
    end 

  
    def make_reservation(room_number, start_date, end_date)
      room = find_room(room_number)
      
      true_for_all = []

      if room.reservations.length  == 0
          room.reservations << HotelSystem::Reservation.new(next_reservation_number, start_date, end_date)
      else
          room.reservations.each do |res|
            if no_shared_days?(start_date, end_date, res) === true
              true_for_all << true 
            end
          end 
      end 
      
      if true_for_all.length == room.reservations.length 
        room.reservations << HotelSystem::Reservation.new(next_reservation_number, start_date, end_date)
      else 
        raise ArgumentError.new("you can't overlap reservations")
      end 
    end

    
  #there may be some cases where a reservation starts when one ends, but trust me it still works the method name isn't very accurate
    def no_shared_days?(start_date, end_date, reservation)
      count = 0 
      reservation_start = reservation.start_date
      reservation_end = reservation.end_date
      while start_date < end_date
        while reservation_start < reservation_end
          if start_date == reservation_start 
            count += 1
          end 
          reservation_start = reservation_start +  1
       end 
       reservation_start = reservation.start_date 
       start_date += 1
      end 
      if (reservation.end_date - reservation.start_date == 1) && reservation_start == start_date
        return false 
      else
        return count < 2
      end 
    end 
     
    private

    #used for fine_reservations_for_room and list_reservations_with_date 
    def is_between_two_dates(range_wanted, date)
      return date >= range_wanted[0] && date <= range_wanted[1];
    end

    def next_reservation_number  
      max = 0 
      @rooms.each do |room|
        room.reservations.each do |reservation| 
          if max < reservation.reservation_number
            max = reservation.reservation_number
          end 

        end
      end
      return max + 1 
    end

    def cost_with_discount(rate, room)
      return room.cost_per_night - (room.cost_per_night*(rate/100))
    end 
  end 
end 


def main
end

main
