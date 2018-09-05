# create module for reservations to hold classes
module Reservation
  #
  class ReserveRoom
    attr_accessor :room_status, :start_date, :end_date, :cost

    def initialize(room_status, start_date, end_date, cost = 200)
      @room_status = room_status
      @start_date = start_date
      @end_date = end_date
      @cost = cost
    end
    #
    # def start_date
    #   @start_date = start_date
    # end
    # def end_date
    #   @end_date = end_date
    # end

    def self.create_reservation
      @new_reservation = Reservation.new
    end
  end

  def check_room_status
    if :room_status == :Available
      puts 'Room is available.'
    elsif :room_status == :Unavailable
      puts 'Room is not available.'
    end 
  end
end
class BookingDates
end
