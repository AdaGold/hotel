# hotel.rb

# class Room -- do we need a room class or just a reservation one?
require 'date'
require 'awesome_print'

# https://ruby-doc.org/stdlib-2.4.1/libdoc/date/rdoc/Date.html

# a single reservations
class Reservation
  # attribute accessor
  attr_accessor :start_date, :end_date, :room_number, :total_cost, :reservation_id, :discount, :block_id

  # initialize
  def initialize(start_year, start_month, start_day, end_year, end_month, end_day, room_number, cost, discount, block_id)
    @start_date = Date.new(start_year, start_month, start_day)
    @end_date = Date.new(end_year, end_month, end_day)
    @room_number = room_number
    @cost = cost
    @total_cost = @cost*(1-discount)*(@end_date. - @start_date).to_i
    @reservation_id = @start_date.to_time.to_i / (60 * 60 * 24) + room_number #ID is start date as integer plus room number
    @discount = discount
    @block_id = block_id
  end
end

# the hotel system
class HotelSystem
  # attribute accessor
  attr_accessor :room_numbers, :blocked_rooms, :date_reservation_hash, :id_reservation_hash, :blocks_hash, :date_block_hash

  # initialize
  def initialize()
    @room_numbers = (1..20).to_a #[1, 2, 3, 4, ... 20]
    @blocked_rooms = []
    @date_reservation_hash = {} #hash where key is date and value is rooms reserved on that date
    @id_reservation_hash = {} # has where key is ID and value is Reservation object
    @date_block_hash = {} #date key, rooms reserved in block
    @blocks_hash = {} # key = block ID, value = array start, end, room numbers, rooms_booked, discount
  end

  # make a reservation
  # updates attributes: id_reservation_hash and date_reservation_hash
  def make_reservation(start_year, start_month, start_day, end_year, end_month, end_day, room_number, cost, discount, block_id)

    # check what rooms are not reserved
    available_rooms = self.get_available_rooms(start_year, start_month, start_day, end_year, end_month, end_day)[0]

    # check which rooms ares part of a block
    blocked_rooms = self.get_available_rooms(start_year, start_month, start_day, end_year, end_month, end_day)[1]

    reservation = Reservation.new(start_year, start_month, start_day, end_year, end_month, end_day, room_number, cost, discount, block_id)

    #---exception handling---
    # invalid date range
    if (reservation.end_date - reservation.start_date).to_i < 1
      raise ArgumentError.new("Can't make a reservation for less than 1 day")
    end

    # room already booked
    if available_rooms.include?(reservation.room_number) == false
      raise ArgumentError.new("That room is already booked")
    end

    # can't make a reservation of a blocked room outside block
    if (blocked_rooms.include?(reservation.room_number) == true && block_id == 0)
        raise ArgumentError.new("That room is only available as part of a block")
    end
    #---exception handling---

    # keys for date_reservation_has and id_reservation_hash
    date_key = reservation.start_date
    reservation_id = reservation.reservation_id

    # iterate through dates from start_date to end_date
    while date_key < reservation.end_date
      # add room number to date_reservation hash
      if @date_reservation_hash[date_key] == nil # first entry
        @date_reservation_hash[date_key] = [reservation.room_number]
      #add a value to the list of reservations
      else
        @date_reservation_hash[date_key] << reservation.room_number
      end
      # update the date
      date_key += 1
    end

    # update id_reservation_hash
    @id_reservation_hash[reservation_id] = [reservation.start_date, reservation.end_date, reservation.room_number, reservation.total_cost]

  end

  # available rooms method - returns array of available rooms and blocked for given date range
  def get_available_rooms(start_year, start_month, start_day, end_year, end_month, end_day)
    #initialize available_rooms
    available_rooms = @room_numbers.dup
    blocked_rooms = []

    # make start_date and end_date objects
    start_date = Date.new(start_year, start_month, start_day)
    end_date = Date.new(end_year, end_month, end_day)

    #create keys for hash
    date_key = start_date

    # loops through dates
    while date_key < end_date

      # loop through room numbers
      available_rooms.each do |room|
        #remove reserved rooms from available rooms array
        if @date_reservation_hash[date_key] == nil
          available_rooms = available_rooms
        elsif @date_reservation_hash[date_key].include?(room)
          available_rooms.delete(room)
        end

        #put blocked rooms in an array
        if @date_block_hash[date_key] == nil
          blocked_rooms = blocked_rooms
        elsif @date_block_hash[date_key].include?(room) == true && blocked_rooms.include?(room) == false
          blocked_rooms << room
        end
      end

      date_key += 1
    end

    return [available_rooms, blocked_rooms]
  end

  # updates blocks hash with info about block: [start_date, end_date, rooms, discount]
  def create_block(start_year, start_month, start_day, end_year, end_month, end_day, block_rooms, cost, discount)
    # dates
    start_date = Date.new(start_year, start_month, start_day)
    end_date = Date.new(end_year, end_month, end_day)

    # create an id for the block which is (100000*num_days + (start_date +  first room number)
    num_days = end_date - start_date
    block_id = ((num_days*100000) + start_date.to_time.to_i / (60 * 60 * 24) + block_rooms[0]).to_i

    # check what rooms are available
    available_rooms = self.get_available_rooms(start_year, start_month, start_day, end_year, end_month, end_day)[0]

    blocked_rooms = self.get_available_rooms(start_year, start_month, start_day, end_year, end_month, end_day)[1]

    # raise exception if room is not available either because
    # it's reserved as an individual reservation or
    # it's already part of another block for those days
    block_rooms.each do |room|
      if (available_rooms.include?(room) == false) || (blocked_rooms.include?(room) == true)
        raise ArgumentError.new("Room #{room} is not available to be part of the block")
      end
    end

    date_key = start_date

    # iterate through dates from start_date to end_date
    while date_key < end_date
      # add room number to date_block hash
      if @date_block_hash[date_key] == nil # first entry
        @date_block_hash[date_key] = block_rooms
      #add a value to the list of reservations
      else
        @date_block_hash[date_key] += block_rooms
      end

      # update the date
      date_key += 1
    end

    reserved_block_rooms = []
    @blocks_hash[block_id] = [start_date, end_date, block_rooms, reserved_block_rooms, discount]
  end

  def reserve_blocked_room(block_id, room)
    #block info
    start_date = @blocks_hash[block_id][0]
    end_date = @blocks_hash[block_id][1]
    rooms = @blocks_hash[block_id][2]
    reserved_block_rooms = @blocks_hash[block_id][3]
    discount = @blocks_hash[block_id][4]

    # Error if this room is not in the block
    if rooms.include?(room) == false
      raise ArgumentError.new("Room #{room} is not in this block.")
    end

    # make reservation
    self.make_reservation(start_date.year, start_date.month, start_date.day, end_date.year, end_date.month, end_date.day, room, 200, discount, block_id)

    # update rooms reserved from this block
    @blocks_hash[block_id][3] << room
  end
end


#=begin

# tests -- moved to spec_helper.rb
puts " \n\n\n"
puts "-------------------------------------"
puts "test wave one and two"
puts "-------------------------------------\n"
puts "reserve rooms 18, 19, and 20"
marriott = HotelSystem.new()
marriott.make_reservation(2019, 5, 31, 2019, 6, 3, 20, 200, 0, 0)
marriott.make_reservation(2019, 5, 31, 2019, 6, 3, 19, 200, 0, 0)
marriott.make_reservation(2019, 5, 31, 2019, 6, 3, 18, 200, 0, 0)
puts "available rooms: #{marriott.get_available_rooms(2019, 5, 31, 2019, 6, 3)[0]} \n"
puts "id_reservation_hash: "
ap marriott.id_reservation_hash
puts "date_reservation_hash:"
ap marriott.date_reservation_hash
puts " "
puts "-------------------------------------"
puts "test wave three"
puts "-------------------------------------"
puts "create 3 blocks: 5/31/19 - 6/3/19: [1, 2, 3, 4] and [5, 6, 7, 8]"
puts "6/3/19 - 6/5/19: [5,6]"
marriott.create_block(2019, 5, 31, 2019, 6, 3, [1, 2, 3, 4], 200, 0.15)
marriott.create_block(2019, 5, 31, 2019, 6, 3, [5, 6, 7, 8], 200, 0.15)
marriott.create_block(2019, 6, 3, 2019, 6, 5, [5, 6], 200, 0.15)
puts "blocks_hash:"
ap marriott.blocks_hash
puts " "
puts "date_block_hash:"
ap marriott.date_block_hash
puts " "
puts "reserve room 5 and 6 from block 318052"
marriott.reserve_blocked_room(318052, 5)
marriott.reserve_blocked_room(318052, 6)
puts " "
puts "date_reservation_hash:"
ap marriott.date_reservation_hash
puts " "
puts "blocks_hash:"
ap marriott.blocks_hash
puts "rooms available to book 5/31/19 - 6/3/19: #{marriott.get_available_rooms(2019, 5, 31, 2019, 6, 3)[0]}"
puts "rooms included in a block 5/31/19 - 6/3/19: #{marriott.get_available_rooms(2019, 5, 31, 2019, 6, 3)[1]}"
puts "rooms available to book 6/3 - 6/5: #{marriott.get_available_rooms(2019, 6, 3, 2019, 6, 5)[0]}"
puts "rooms included in a block 6/3 - 6/5: #{marriott.get_available_rooms(2019, 6, 3, 2019, 6, 5)[1]}"
puts "reserve room 5 and 6 room from block 218055"
marriott.reserve_blocked_room(218055, 5)
marriott.reserve_blocked_room(218055, 6)
puts "blocks_hash"
ap marriott.blocks_hash
puts " "
puts "date_block_hash"
ap marriott.date_block_hash
puts " "
puts "date_reservation_hash"
ap marriott.date_reservation_hash
puts " "
puts "id_reservation_hash"
ap marriott.id_reservation_hash
puts " "

#=end
