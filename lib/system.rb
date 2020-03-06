require "date"

require_relative "room.rb"
require_relative "reservation.rb"
require_relative "date_range.rb"

module Hotel
  class System
    attr_reader :reservations, :rooms

    def initialize(number_of_rooms)
      @reservations = []
      @rooms = (1..20).to_a
    end

    def create_reservation(start_date, end_date)
      date_range = DateRange.new(start_date, end_date)
      room = find_avail_room(date_range)
      if !room
        raise "there is no available room"
      end
      reservation = Reservation.new(date_range, room)
      reservations << reservation
    end

    #helper method
    def find_avail_room(date_range)
      rooms.each do |room|
        room_reservation = reservations.select { |reservation| reservation.room == room }
        if !room_reservation.any? { |reservation| reservation.overlap?(date_range) }
          return room
        end
      end
      return
    end

    def get_reservation
      # get room_num, get start_date and end_date as inputs and return reservations
    end

     def get_reservations(date)
      return reservation.select {|reservation| reservation.date_range.with_in_range(date)} 
    end

  end
end

# 1) Write pseudocode
# 2) Write test(s)
# 3) Write code
# 4) Refactor
# 5) Commit

# WAVE 1
# write the functionality for the system to track valid reservations
# Your job is to only build the classes that store information and handle business logic

# I can access the list of all of the rooms in the hotel (done)
# I access the list of reservations for a specified room and a given date range (change the date using parse method)

# I can access the list of reservations for a specific date, so that I can track reservations by date

# I can get the total cost for a given reservation

# I want exception raised when an invalid date range is provided, so that I can't make a reservation for an invalid date range

# Detail
# The hotel has 20 rooms, and they are numbered 1 through 20
# Every room is identical, and a room always costs $200/night
# The last day of a reservation is the checkout day, so the guest should not be charged for that night
# When reserving a room, the user provides only the start and end dates
# the library should determine which room to use for the reservation
# For this wave, any room can be reserved at any time, and you don't need to check whether reservations conflict with each other (this will come in wave 2!)

# WAVE 2
