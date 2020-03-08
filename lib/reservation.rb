# creating reservation class
require_relative "system.rb"

module Hotel
  class Reservation
    attr_reader :date_range, :room_num, :cost_per_night

    def initialize(date_range, room_num)
      @date_range = date_range
      @room_num = room_num
      @cost_per_night = 200
    end

    def get_cost
      return date_range.duration * cost_per_night
    end

    # to get the total cost, need the duration (as input wont be able to dirctly get duration but will get res id)
    # go throught the reservation array to get one one rervation which matches the id
    # get that reservation_id to get the duration
    # after getting duration, calculate cost

    #  found_reservation = @reservations.find do |reservation|
    #   reservation.reservation_id == reservation_id
    #  end

    # duration = found_reservation.date_range.duration()

  end
end
