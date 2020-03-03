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