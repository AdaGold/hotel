require 'date'
require 'pry'

require_relative 'hotel'

module HotelManager
	class Reservation

		attr_reader :id, :customer_id, :start_date, :end_date, :room_cost, :room, :room_id
		# Initialize reservation with start/end date, cost (default $200), customer id
		# Raise exception for invalid date range is provided 
		def initialize (
			id: , 
			customer_id: , 
			start_date: , 
			end_date: , 
			room_cost: 200, 
			room: nil,
			room_id: nil
			)

			@id = id
			@customer_id = customer_id
			@start_date = start_date
			@end_date = end_date
			@room_cost = room_cost
			@room = room

			if room
				@room = room
				@room_id = room_id
			elsif
				@room_id = room_id
			else
				raise ArgumentError, "Room or room_id is required"
			end

			if @start_date.class() != Date
				raise ArgumentError, "Start date #{@start_date} not valid"
			end  

			if @end_date.class() != Date
				raise ArgumentError, "End date #{@end_date} not valid"
			end 
			
			if @start_date >= @end_date 
				raise ArgumentError, "#{@start_date} is before #{@end_date} "
			end
		end

		# Calculate cost of reservation (exclusive of last date)
		def total_cost
			@room_cost * (@end_date - @start_date - 1)
		end
		
		# Check whether date is within range 
		def check_date(search_date)
			(search_date >= @start_date) && (search_date <= @end_date)
		end

		# Check whether date range overlaps with reservation
		def check_date_range(date_one, date_two)
			if date_one < date_two
				first_date, second_date = date_one, date_two
			else
				first_date, second_date = date_two, date_one
			end

			(first_date >= @start_date && first_date < @end_date) || (second_date < @end_date && second_date > @start_date) 
		end

		# Check whether reservation is within range 
		def check_reservation_range(date_one, date_two)
			if date_one < date_two
				first_date, second_date = date_one, date_two
			else
				first_date, second_date = date_two, date_one
			end

			first_date < @end_date && second_date > @start_date
		end

	end
end

# Add in requirement that room must be populated