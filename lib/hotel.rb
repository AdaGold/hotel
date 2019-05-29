# hotel.rb

# class Room -- do we need a room class or just a reservation one?
require 'date'

# https://ruby-doc.org/stdlib-2.4.1/libdoc/date/rdoc/Date.html

=begin
# Reservation class
attributes
- start date
- end date
- room number
- total cost

# HotelSystem class
attributes
- all room numbers in hotel (an array)
- rooms reserved by date with date as key, and an array of room numbers reserved on that date as the value (a hash)
- reservations hash with reservation ID as key, reservation object as value (a hash)

methods
- make_a_reservation
  -- instantiate a Reservation object)
  -- add reservation to date/reservation hash
  -- give reservation an ID and add it to a hash

- see available rooms (Wave 2)
=end

# a single reservations
class Reservation

  # attribute accessor
  attr_accessor :start_date, :end_date, :room_number, :total_cost, :id

  # initialize
  def initialize(start_year, start_month, start_day, end_year, end_month, end_day, room_number, cost)
    @start_date = Date.new(start_year, start_month, start_day)
    @end_date = Date.new(end_year, end_month, end_day)
    @room_number = room_number
    @cost = cost
    @total_cost = (@end_date. - @start_date).to_i*@cost
    @id = @start_date.to_time.to_i / (60 * 60 * 24) + room_number #ID is start date as integer plus room number
  end

end


# the hotel system
class HotelSystem

  # attribute accessor
  attr_accessor :room_numbers, :date_reservation_hash, :id_reservation_hash, :available_rooms

  # initialize
  def initialize()
    @room_numbers = (1..20).to_a #[1, 2, 3, 4, ... 20]
    @date_reservation_hash = {} #hash where key is date and value is rooms reserved on that date
    @id_reservation_hash = {} # has where key is ID and value is Reservation object
    @available_rooms = @room_numbers
  end



  # make a reservation
  def make_reservation(start_year, start_month, start_day, end_year, end_month, end_day)


    #add an exception for an invalid date range
    #check what rooms are available
    self.get_available_rooms(start_year, start_month, start_day, end_year, end_month, end_day)

    reservation = Reservation.new(start_year, start_month, start_day, end_year, end_month, end_day, @available_rooms.sample, 200)

    if (reservation.end_date - reservation.start_date).to_i < 1
      raise ArgumentError.new("Can't make a reservation for less than 1 day")
    end

    if (@available_rooms.include? reservation.room_number == false)
      raise ArgumentError.new("That room is already booked")
    end

    # keys for date_reservation_has and id_reservation_hash
    date = reservation.start_date
    date_key = date.strftime("%m/%d/%Y")
    reservation_id = reservation.id.to_s

    # iterate through dates from start_date to end_date
    while date < reservation.end_date

      # add room number to date_reservation hate
      if @date_reservation_hash[date_key] == nil # first entry
        @date_reservation_hash[date_key] = [reservation.room_number]
      #add a value to the list of reservations
      else
        @date_reservation_hash[date_key] << reservation.room_number
      end

      # update the date
      date += 1
      date_key = date.strftime("%m/%d/%Y")

    end

    # update id_reservation_hash
    @id_reservation_hash[reservation_id] = [reservation.start_date.strftime("%m/%d/%Y"), reservation.end_date.strftime("%m/%d/%Y"), reservation.room_number, reservation.total_cost]

    # update the available rooms FileList
    self.get_available_rooms(start_year, start_month, start_day, end_year, end_month, end_day)
  end

  def get_available_rooms(start_year, start_month, start_day, end_year, end_month, end_day)
    # make start_date and end_date objects
    start_date = Date.new(start_year, start_month, start_day)
    end_date = Date.new(end_year, end_month, end_day)

    date = start_date
    date_key = date.strftime("%m/%d/%Y")

    # loops through dates
    while date < end_date

    # loop through room numbers
      @available_rooms.each do |room|
        if @date_reservation_hash[date_key] == nil
          @available_rooms = @available_rooms
        elsif @date_reservation_hash[date_key].include? room
          @available_rooms.delete(room)
        end
      end
      date += 1
      date_key = date.strftime("%m/%d/%Y")
    end
  end

end


#reservation = Reservation.new(2019, 1, 27, 2019, 1, 29, 2, 200)
#puts reservation

# test wave one
puts "-------------------------------------"
puts "-------------------------------------"
marriott = HotelSystem.new()
puts "make a bunch of reservations"
puts "available rooms: #{marriott.available_rooms}"
puts " "
marriott.make_reservation(2019, 5, 31, 2019, 6, 3)
marriott.make_reservation(2019, 5, 31, 2019, 6, 3)
marriott.make_reservation(2019, 5, 31, 2019, 6, 3)
marriott.make_reservation(2019, 5, 31, 2019, 6, 3)
puts " "
puts "id_reservation_ash: #{marriott.id_reservation_hash}"
puts " "
puts "date_reservation_ash: #{marriott.date_reservation_hash}"
puts " "
# should return exception
# marriott.make_reservation(2019, 6, 30, 2019, 6, 8)

# test wave two
marriott.get_available_rooms(2019, 5, 31, 2019, 6, 3)
puts " "
puts "available rooms: #{marriott.available_rooms}"
puts " "
puts "make more reservations"
marriott.make_reservation(2019, 5, 31, 2019, 6, 3)
puts " "
puts "available rooms: #{marriott.available_rooms}"
puts "date_reservation_ash: #{marriott.date_reservation_hash}"
marriott.make_reservation(2019, 5, 31, 2019, 6, 3)
puts " "
puts "available rooms: #{marriott.available_rooms}"
puts "date_reservation_ash: #{marriott.date_reservation_hash}"
marriott.make_reservation(2019, 5, 31, 2019, 6, 3)
puts " "
puts "available rooms: #{marriott.available_rooms}"
puts "date_reservation_ash: #{marriott.date_reservation_hash}"
marriott.make_reservation(2019, 5, 31, 2019, 6, 3)
puts " "
puts "available rooms: #{marriott.available_rooms}"
puts "date_reservation_ash: #{marriott.date_reservation_hash}"
puts " "
puts "id_reservation_ash: #{marriott.id_reservation_hash}"
