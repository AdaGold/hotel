require 'date'
require 'pry'

require_relative 'room'

module HotelManager
	class Reservation

		attr_reader :id, :customer_id, :start_date, :end_date, :room_cost, :rooms, :room_ids

		# Room default cost of $200
		def initialize id: , 
									customer_id: , 
									start_date: , 
									end_date: , 
									room_cost: 200, 
									rooms: nil,
									room_ids: nil

			@id = id 
			@customer_id = customer_id
			@start_date = start_date
			@end_date = end_date
			@room_cost = room_cost
			@rooms = rooms 
			@room_ids = room_ids

			validate_date			
			@rooms.nil? ? validate_room(@room_ids) : validate_room(@rooms)
		end

		def validate_room(attribute)
			raise ArgumentError, "Room or room_id is required" if @rooms.nil? && @room_ids.nil?
			
			if attribute.length < 1 || attribute.length > 5
				raise ArgumentError, "#{attribute.length} is an invalid number of rooms for a hotel block"
			end
		end

		# Check input validation
		def validate_date
			if !@start_date.is_a?(Date) || !@end_date.is_a?(Date)
				raise ArgumentError, "Expected #{@start_date} and #{@end_date} to be date"
			elsif @start_date >= @end_date 
				raise ArgumentError, "#{@start_date} must be before #{@end_date}"
			end
		end

		# Calculate cost of reservation, exclusive of last date
		def total_cost
			@room_cost * (@end_date - @start_date - 1) * @rooms.length
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