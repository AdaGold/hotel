# hotel.rb

# class Room -- do we need a room class or just a reservation one?
require 'date'
require 'awesome_print'

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
  attr_accessor :start_date, :end_date, :room_number, :total_cost, :id, :discount

  # initialize
  def initialize(start_year, start_month, start_day, end_year, end_month, end_day, room_number, cost, discount)
    @start_date = Date.new(start_year, start_month, start_day)
    @end_date = Date.new(end_year, end_month, end_day)
    @room_number = room_number
    @cost = cost
    @total_cost = @cost*(1-discount)*(@end_date. - @start_date).to_i
    @id = @start_date.to_time.to_i / (60 * 60 * 24) + room_number #ID is start date as integer plus room number
  end
end

# the hotel system
class HotelSystem
  # attribute accessor
  attr_accessor :room_numbers, :date_reservation_hash, :id_reservation_hash, :blocks_hash, :date_block_hash

  # initialize
  def initialize()
    @room_numbers = (1..20).to_a #[1, 2, 3, 4, ... 20]
    @date_reservation_hash = {} #hash where key is date and value is rooms reserved on that date
    @id_reservation_hash = {} # has where key is ID and value is Reservation object
    @date_block_hash = {} #date key, rooms reserved in block
    @blocks_hash = {} # key = block ID, value = array start, end, room numbers, discount
  end

  # make a reservation
  # updates attributes: id_reservation_hash and date_reservation_hash
  def make_reservation(start_year, start_month, start_day, end_year, end_month, end_day, room, cost, discount)

    #check what rooms are available
    available_rooms = self.get_available_rooms(start_year, start_month, start_day, end_year, end_month, end_day)

    reservation = Reservation.new(start_year, start_month, start_day, end_year, end_month, end_day, room, cost, discount)

    #exception handling
    if (reservation.end_date - reservation.start_date).to_i < 1
      raise ArgumentError.new("Can't make a reservation for less than 1 day")
    end

    if (available_rooms.include? reservation.room_number == false)
      raise ArgumentError.new("That room is already booked")
    end

    # keys for date_reservation_has and id_reservation_hash
    date = reservation.start_date
    date_key = date.strftime("%m/%d/%Y")
    reservation_id = reservation.id.to_s

    # iterate through dates from start_date to end_date
    while date < reservation.end_date

      # add room number to date_reservation hash
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

  end

  # available rooms method
  # returns array of available rooms for given range
  def get_available_rooms(start_year, start_month, start_day, end_year, end_month, end_day)
    available_rooms = @room_numbers

    # make start_date and end_date objects
    start_date = Date.new(start_year, start_month, start_day)
    end_date = Date.new(end_year, end_month, end_day)

    #create keys for hash
    date = start_date
    date_key = date.strftime("%m/%d/%Y")

    # loops through dates
    while date < end_date

    # loop through room numbers
      available_rooms.each do |room|
        #remove reserved rooms from available rooms
        if @date_reservation_hash[date_key] == nil
          available_rooms = available_rooms
        elsif @date_reservation_hash[date_key].include? room
          available_rooms.delete(room)
        end

        #remove blocked rooms from available rooms
        if @date_block_hash[date_key] == nil
          available_rooms = available_rooms
        elsif @date_block_hash[date_key].include? room
          available_rooms.delete(room)
        end
      end
      date += 1
      date_key = date.strftime("%m/%d/%Y")
    end
    return available_rooms
  end

  # updates blocks hash with info about block: [start_date, end_date, rooms, discount]
  def create_block(start_year, start_month, start_day, end_year, end_month, end_day, block_rooms, cost, discount)

    available_rooms = self.get_available_rooms(start_year, start_month, start_day, end_year, end_month, end_day)

    block_rooms.each do |room|
      unless available_rooms.include?room
        raise ArgumentError.new("Room #{room} is not available to be part of the block")
      end
    end

    start_date = Date.new(start_year, start_month, start_day)
    end_date = Date.new(end_year, end_month, end_day)

    # create an id for the block which is (100000*num_days + (start_date +  first room number)
    num_days = end_date - start_date
    block_id = ((num_days*100000) + start_date.to_time.to_i / (60 * 60 * 24) + block_rooms[0]).to_i

    date = start_date
    date_key = date.strftime("%m/%d/%Y")
    # iterate through dates from start_date to end_date
    while date < end_date
      # add room number to date_reservation hash
      if @date_block_hash[date_key] == nil # first entry
        @date_block_hash[date_key] = block_rooms
      #add a value to the list of reservations
      else
        @date_block_hash[date_key].concat block_rooms
      end

      # update the date
      date += 1
      date_key = date.strftime("%m/%d/%Y")
    end

    @blocks_hash[block_id] = [start_date, end_date, block_rooms, discount]
  end

  def reserve_blocked_room(block_id, room)
    #block info
    block_info = @blocks_hash[block_id]

    start_date = block_info[0]
    end_date = block_info[1]
    rooms = block_info[2]
    discount = block_info[3]

    # make reservation
    self.make_reservation(start_date.year, start_date.month, start_date.day, end_date.year, end_date.month, end_date.day, room, 200, discount)

    unless rooms.include?room
      raise ArgumentError.new("Room #{room} is not in this block.")
    end

    # update rooms available in block
    @blocks_hash[block_id][2].delete(room)
  end

end

puts " "
puts " "
puts " "
puts " "
puts " "
puts "-------------------------------------"
puts "test wave one and two"
puts "-------------------------------------"
puts " "
marriott = HotelSystem.new()
puts "make a bunch of reservations"
marriott.make_reservation(2019, 5, 31, 2019, 6, 3, marriott.get_available_rooms(2019, 5, 31, 2019, 6, 3).pop, 200, 0)
marriott.make_reservation(2019, 5, 31, 2019, 6, 3, marriott.get_available_rooms(2019, 5, 31, 2019, 6, 3).pop, 200, 0)
marriott.make_reservation(2019, 5, 31, 2019, 6, 3, marriott.get_available_rooms(2019, 5, 31, 2019, 6, 3).pop, 200, 0)
puts "available rooms:"
ap marriott.get_available_rooms(2019, 5, 31, 2019, 6, 3)
puts " "
puts "id_reservation_ash: "
ap marriott.id_reservation_hash
puts " "
puts "date_reservation_ash:"
ap marriott.date_reservation_hash
puts " "
puts "-------------------------------------"
puts "test wave three"
puts "-------------------------------------"
puts "create 2 blocks"
puts " "
marriott.create_block(2019, 5, 31, 2019, 6, 3, [1, 2, 3, 4], 200, 0.15)
marriott.create_block(2019, 5, 31, 2019, 6, 3, [5, 6, 7, 8], 200, 0.15)
puts "blocks_hash:"
ap marriott.blocks_hash
puts " "
puts "date_block_hash:"
ap marriott.date_block_hash
puts " "
puts "available rooms:"
ap marriott.get_available_rooms(2019, 5, 31, 2019, 6, 3)
puts " "
puts "reserve a room from a block"
puts " "
#should return an exception
#marriott.reserve_blocked_room(318052, 1)
marriott.reserve_blocked_room(318052, 5)
puts "blocks"
ap marriott.blocks_hash
puts " "
puts "date_block_hash"
ap marriott.date_block_hash
puts " "
puts "available rooms"
ap marriott.get_available_rooms(2019, 5, 31, 2019, 6, 3)
puts " "
puts "date_reservation_ash"
ap marriott.date_reservation_hash
puts " "
puts "id_reservation_ash"
ap marriott.id_reservation_hash
puts " "
