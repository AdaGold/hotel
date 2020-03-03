require 'pry'
require 'date'

require_relative 'reservation'
require_relative 'room'

module HotelManager
	class ReservationManager

		attr_reader :rooms, :reservations

		# Populate hotel with 20 rooms upon initialization
		def initialize
			@rooms = []
			@reservations = []

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
				if reservation.check_date_range(first_date, second_date) && reservation.room_id == room
					reservation_by_room_date << reservation 
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

			return reservation_by_date.empty? ? "No reservations found within date range." : reservation_by_date
		end

		def list_room_by_range(first_date, second_date) 
		
			if first_date.class != Date || second_date.class != Date 
				raise ArgumentError, "One date (#{first_date} or #{second_date}) is not valid"
			end 

			available_rooms = @rooms.dup
			
			@reservations.each do |reservation|
				if reservation.check_date_range(first_date, second_date)
					available_rooms -= [find_room(reservation.room_id)]
				end
			end
			
			return available_rooms.empty? ? "No rooms available in this date range." : available_rooms
		end
	end
end
