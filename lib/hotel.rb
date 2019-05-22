# class Room -- do we need a room class or just a reservation one?
require Date

#classes and modules

class Reservation
  attr_accessor :start_date, :end_date

  def initialize(start_year, start_month, start_day, end_year, end_month, end_day, number, cost)
    @start_date = Date.new(start_year, start_month, start_day)
    @end_date = Date.new(end_year, end_month, end_day)
    @number = number
    @cost = 200
  end

end

module HotelSystem

  room_numbers = (1..20).to_a

  # make a reservation
  def make_reservation(start_year, start_month, start_day, end_year, end_month, end_day, number, cost)
    reservation = Reservation.new(start_date, end_date)
  end

  # access list of reservations
  def get_reservations()
  end

  # access list of rooms
  def get_rooms()
  end

  # get total cost of given reservation
  def total_cost()
  end
end
