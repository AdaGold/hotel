require 'date'
require 'pry'

require_relative 'reservation'
require_relative 'room'

module HotelManager
	class ReservationBlock < Reservation

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
			
			if attribute.length <= 1 || attribute.length > 5
				raise ArgumentError, "#{attribute.length} is an invalid number of rooms for a hotel block"
			end
		end

		# Calculate cost of reservation (exclusive of last date)
		def total_cost
			super * @rooms.length
		end

	end
end