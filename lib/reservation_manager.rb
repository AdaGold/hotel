require 'pry'
require 'date'

require_relative 'reservation'
require_relative 'room'

module HotelManager
	class ReservationManager

		attr_reader :rooms, :reservation_blocks

		# Populate hotel with 20 rooms upon initialization
		def initialize
			@rooms = []
			@reservation_blocks = []

			20.times do |index|
				@rooms << HotelManager::Room.new(id: index + 1)
			end
		end

		# Creates and saves new reservation/block to instance variables
		def save_reservation(first_date, second_date, num_of_rooms: 1, customer_id: nil, room_cost: 200)

			# change list_room_by_range to return argument rather than string
			available_rooms = list_room_by_range(first_date,second_date)
			chosen_rooms = available_rooms.take(num_of_rooms)

			raise ArgumentError, "No rooms available" if chosen_rooms.empty?

			chosen_rooms.map!{|room| room.id}

			new_reservation = HotelManager::Reservation.new(
				id: @reservation_blocks.length + 1, 
				customer_id: customer_id, 
				start_date: first_date, 
				end_date: second_date,
				room_cost: room_cost, 
				room_ids: chosen_rooms
			)

			@reservation_blocks << new_reservation
		end

		def find_room(id)
			@rooms.find { |room| room.id == id }
		end

		# List out all rooms in hotel 
		def rooms_list
			@rooms.map {|room| "Room: #{room.id}"}.join(", ")
		end

		# List out all reservations by room and date range
		def search_by_room_date(room, first_date, second_date)
			raise ArgumentError, "Room #{room} does not exist" if @rooms.last.id < room

			reservation_room_date = []

			@reservation_blocks.each do |reservation_block|
				found_room = reservation_block.room_ids.include? room
				if reservation_block.check_reservation_range(first_date,second_date) && found_room
					reservation_room_date << reservation_block
				end
			end
			
			return reservation_found?(reservation_room_date, "reservations")
		end

		# List out reservations by specific date
		def search_by_date(date)
			reservation_by_date = []

			@reservation_blocks.each do |reservation_block|
				reservation_by_date << reservation_block if reservation_block.check_date(date)
			end

			return reservation_found?(reservation_by_date, "reservations")
		end

		def list_room_by_range(first_date, second_date) 

			available_rooms = @rooms.dup

			@reservation_blocks.each do |reservation_block|
				if reservation_block.check_reservation_range(first_date, second_date)
					reservation_block.room_ids.each do |room_id|
						available_rooms -= [find_room(room_id)]
					end
				end
			end
			
			return reservation_found?(available_rooms, "rooms")
		end

		# Raise argument error if no items found
		def reservation_found? tracker, type
			raise ArgumentError, "No #{type} available in date range." if tracker.empty?

			return tracker
		end

	end
end
