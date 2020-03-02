require_relative 'test_helper'

describe "Reservation Class" do
	describe "initialize" do
		before do
			@reservation = HotelManager::Reservation.new()
		end

		it "is an instance of Reservation" do
			expect(@reservation).must_be_kind_of HotelManager::Reservation
		end

		# Raises argument error if invalid date range
		# Confirms that total cost is calculated correctly
		# Validate that start/end date is a date class
	end
end