require 'date'
require 'pry'

require_relative 'hotel'

module HotelManager
	class Reservation

		attr_reader :id, :customer_id, :start_date, :end_date, :room_cost, :room
		# Initialize reservation with start/end date, cost (default $200), customer id
		# Raise exception for invalid date range is provided 
		def initialize (
			id: , 
			customer_id: , 
			start_date: , 
			end_date: , 
			room_cost: 200, 
			room:
			)

			@id = id
			@customer_id = customer_id
			@start_date = start_date
			@end_date = end_date
			@room_cost = room_cost
			@room = room

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
		

		# Choose first available room for reservation 

	end
end
