require 'pry'
require 'date'

require_relative 'reservation'
require_relative 'room'

module HotelManager
	class ReservationManager

		attr_reader :rooms, :reservations

		# Load initial reservation data to variable
		def initialize
			@rooms = []
			@reservations = []

			20.times do |index|
				@rooms << HotelManager::Room.new(id: index + 1)
			end
		end

		# Add/create new reservation
		def add_reservation(reservation)
			@reservations << reservation
		end

		# Create connection between room and reservation when new booking is made

		# List out all rooms in hotel 
		def rooms_list
			@rooms.map {|room| "Room: #{room.id}"}.join(", ")
		end

		# List out all reservations by room and date range
		# Error handling if date is not entered properly, or date range is invalid (store in master class?)
		def search_by_room_date(room, first_date, second_date)
		
			if first_date.class != Date || second_date.class != Date 
				raise ArgumentError, "One date (#{first_date} or #{second_date}) is not valid"
			end 
			
			if @rooms.last.id < room
				raise ArgumentError, "Room #{room} does not exist"
			end

			reservation_by_room_date = []
			@reservations.each do |reservation|
				if reservation.check_date_range(first_date, second_date) && reservation.room == room
					reservation_by_room_date << reservation 
				end
			end
			
			if reservation_by_room_date.empty?
				return "No reservations found within date range."
			else
				return reservation_by_room_date
			end
		end

		# List out reservations by specific date
		def search_by_date(date)
			reservation_by_date = []
			@reservations.each do |reservation|
				reservation_by_date << reservation if reservation.check_date(date)
			end

			if reservation_by_date.empty?
				return "No reservations found within date range."
			else
				return reservation_by_date
			end
		end

	end
end
