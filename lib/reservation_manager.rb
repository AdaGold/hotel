require 'pry'
require 'date'

require_relative 'reservation'
require_relative 'reservation_block'
require_relative 'room'

module HotelManager
	class ReservationManager

		attr_reader :rooms, :reservations, :reservation_blocks

		# Populate hotel with 20 rooms upon initialization
		def initialize
			@rooms = []
			@reservations = []
			@reservation_blocks = []

			20.times do |index|
				@rooms << HotelManager::Room.new(id: index + 1)
			end
		end

		# Add/create new reservation
		def add_reservation(reservation, class_storage)
			potential_rooms = self.list_room_by_range(reservation.start_date, reservation.end_date) 

			if reservation.class == HotelManager::Reservation
				found_room = potential_rooms.include? find_room(reservation.room_id)
			elsif reservation.class == HotelManager::ReservationBlock
				found_room = reservation.room_ids.map do |room_id|
					potential_rooms.include? find_room(room_id)
				end.all? (true)
			end

			if found_room
				class_storage << reservation
			else 
				raise ArgumentError, "#{reservation.class} double booked. Not saved to reservation manager."
			end
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
			search_date_validation(first_date,second_date)
			raise ArgumentError, "Room #{room} does not exist" if @rooms.last.id < room

			reservation_room_date = []
			@reservations.each do |reservation|
				if reservation.check_reservation_range(first_date, second_date) && reservation.room_id == room
					reservation_room_date << reservation 
				end
			end
			
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
			@reservations.each do |reservation|
				reservation_by_date << reservation if reservation.check_date(date)
			end

			@reservation_blocks.each do |reservation_block|
				reservation_by_date << reservation_block if reservation_block.check_date(date)
			end

			return reservation_found?(reservation_by_date, "reservations")
		end

		def list_room_by_range(first_date, second_date) 
			search_date_validation(first_date,second_date)

			available_rooms = @rooms.dup
			
			@reservations.each do |reservation|
				if reservation.check_reservation_range(first_date, second_date)
					available_rooms -= [find_room(reservation.room_id)]
				end
			end
			
			@reservation_blocks.each do |reservation_block|
				if reservation_block.check_reservation_range(first_date, second_date)
					reservation_block.room_ids.each do |room_id|
						available_rooms -= [find_room(room_id)]
					end
				end
			end
			
			return reservation_found?(available_rooms, "rooms")
		end

		def reservation_found? (tracker, type)
			tracker.empty? ? "No #{type} available in date range." : tracker
		end

		# potentially move to own class to be inherited?
		def search_date_validation(first_date, second_date)
			if first_date.class != Date || second_date.class != Date 
				raise ArgumentError, "One date (#{first_date} or #{second_date}) is not valid"
			end 
		end

	end
end
