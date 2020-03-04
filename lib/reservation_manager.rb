require 'pry'
require 'date'

require_relative 'reservation'
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
		def add_reservation(reservation)
			potential_rooms = self.list_room_by_range(reservation.start_date, reservation.end_date) 
			
			if potential_rooms.include? find_room(reservation.room_id)
				@reservations << reservation
			else 
				raise ArgumentError, "Room #{reservation.room_id} is double booked. Reservation not finalized in reservation manager."
			end
		end

		def find_room(id)
      return @rooms.find { |room| room.id == id }
		end
		
		# Add/create new block reservation
		def add_reservation_block(reservation_block)
			potential_rooms = self.list_room_by_range(reservation_block.start_date, reservation_block.end_date) 
			
			found_room = reservation_block.room_ids.map do |room_id|
					potential_rooms.include? find_room(room_id)
				end.all? (true)
			
			if found_room
				@reservation_blocks << reservation_block
			else 
				raise ArgumentError, "Some of rooms #{reservation_block.room_ids} are double booked. Hotel block not finalized in reservation manager."
			end
		end

		def find_room(id)
      return @rooms.find { |room| room.id == id }
    end

		# List out all rooms in hotel 
		def rooms_list
			@rooms.map {|room| "Room: #{room.id}"}.join(", ")
		end

		# List out all reservations by room and date range
		# Error handling if date is not entered properly, or date range is invalid (store in master class?)
		def search_by_room_date(room, first_date, second_date)
			search_date_validation(first_date,second_date)
			raise ArgumentError, "Room #{room} does not exist" if @rooms.last.id < room

			reservation_by_room_date = []
			@reservations.each do |reservation|
				if reservation.check_reservation_range(first_date, second_date) && reservation.room_id == room
					reservation_by_room_date << reservation 
				end
			end
			
			@reservation_blocks.each do |reservation_block|
			
				found_room = reservation_block.room_ids.include? room
				if reservation_block.check_reservation_range(first_date,second_date) && found_room
					reservation_by_room_date << reservation_block
				end
			end
			
			return reservation_by_room_date.empty? ? "No reservations found within date range." : reservation_by_room_date
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

			return reservation_by_date.empty? ? "No reservations found within date range." : reservation_by_date
		end

		def list_room_by_range(first_date, second_date) 
			search_date_validation(first_date,second_date)

			available_rooms = @rooms.dup
			
			@reservations.each do |reservation|
				if reservation.check_date_range(first_date, second_date)
					available_rooms -= [find_room(reservation.room_id)]
				end
			end
			
			@reservation_blocks.each do |reservation_block|
				if reservation_block.check_date_range(first_date, second_date)
					reservation_block.room_ids.each do |room_id|
						available_rooms -= [find_room(room_id)]
					end
				end
			end
			
			return available_rooms.empty? ? "No rooms available in this date range." : available_rooms
		end

		def search_date_validation(first_date, second_date)
			if first_date.class != Date || second_date.class != Date 
				raise ArgumentError, "One date (#{first_date} or #{second_date}) is not valid"
			end 
		end

	end
end
