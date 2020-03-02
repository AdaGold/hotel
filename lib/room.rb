module HotelManager
	class Room

		attr_reader :id
		# Create new room with attributes: number, status
		def initialize (id: )
			@id = id
		end

	end
end