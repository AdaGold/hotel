require_relative 'test_helper'

describe "Reservation Class" do
	before do
		@reservation_data = {
			id: 1,
			customer_id: 1, 
			start_date: Date.new(2020,3,2),
			end_date: Date.new(2020,3,5),
			room_cost: 200,
			room: HotelManager::Room.new(id: 1)
		}
		@reservation = HotelManager::Reservation.new(@reservation_data)
	end

	it "is an instance of Reservation" do
		expect(@reservation).must_be_kind_of HotelManager::Reservation
	end

	it "validates that start/end date is a date class" do
		expect(@reservation.end_date).must_be_kind_of Date
		expect(@reservation.start_date).must_be_kind_of Date
	end

	it "raises argument error if start is not date class" do
		@reservation_data[:start_date] = "Janurary 5th, 2020"
		expect{HotelManager::Reservation.new(@reservation_data)}.must_raise ArgumentError
	end

	it "raises argument error if end before start date" do
		
		@reservation_data[:start_date] = Date.new(2020,3,5)
		@reservation_data[:end_date] = Date.new(2020,3,2)
		expect{HotelManager::Reservation.new(@reservation_data)}.must_raise ArgumentError
	end

	it "calculates total cost correctly" do
		reservation_cost = @reservation.total_cost()
		expect(reservation_cost).must_equal 400
	end

end

# Edge case - date entered is > 31 days per month or leap year
# raise argument error if start and end date are the same

# Able to reserve a hotel block (group of rooms for a specific group of customers for a set period of time)
# Block reservation has more than one room
# Block reservation has less than five rooms
# Block reservation can be at a discount rate
# Block reservation cen be over a period of days
# List of available rooms will not include the rooms in block reservation
# Raise exception if one or more rooms is unavailable for the given date range
# Cannot double book a room for single reservation if it is reserved for a hotel block
# Cannot double book a room for another hotel block if it is reserved for a hotel block 
# Correctly list out whether a given block has any rooms available?
# Able to reserve a specific room from a hotel block, but only for the full duration of the block (individual reservations still work?)
# List of reservation by date will list out both individual and block reservations
# Check to make sure that when a block is reserved, the indivudal room reservation dates will also be there
# Confirm that all availabilty checking logic from Wave 2 also respects room blocks