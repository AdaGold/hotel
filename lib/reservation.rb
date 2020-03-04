require 'date'
require 'pry'

require_relative 'hotel'

module HotelManager
	class Reservation

		attr_reader :id, :customer_id, :start_date, :end_date, :room_cost, 							:room, :room_id

		def initialize (
			id: , 
			customer_id: , 
			start_date: , 
			end_date: , 
			room_cost: 200, # Room default cost of $200
			room: nil,
			room_id: nil
			)

			@id = id
			@customer_id = customer_id
			@start_date = start_date
			@end_date = end_date
			@room_cost = room_cost
			@room = room
			@room_id = room_id

			# Raise exception for missing or invalid inputs

			raise ArgumentError, "Room or room_id is required" if room.nil? && room_id.nil?

			if @start_date.class() != Date || @end_date.class() != Date
				raise ArgumentError, "Date #{@start_date} or #{@end_date} not valid"
			elsif @start_date >= @end_date 
				raise ArgumentError, "#{@start_date} is before #{@end_date} "
			end
		end

		# Calculate cost of reservation, exclusive of last date
		def total_cost
			@room_cost * (@end_date - @start_date - 1)
		end
		
		# Checks if reservation exists on a specific date 
		def check_date(search_date)
			(search_date >= @start_date) && (search_date <= @end_date)
		end

		# Checks whether reservation is within a given date range 
		def check_reservation_range(date_one, date_two)
			first_date = date_one < date_two ? date_one : date_two
			second_date = date_one < date_two ? date_two : date_one
			first_date < @end_date && second_date > @start_date
		end

	end
end