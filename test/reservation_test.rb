require_relative 'test_helper'

describe "Reservation Block Class" do
	before do
		@rooms = [
			HotelManager::Room.new(id: 1),
			HotelManager::Room.new(id: 2),
			HotelManager::Room.new(id: 3),
			HotelManager::Room.new(id: 4),
			HotelManager::Room.new(id: 5)
		]
		@reservation_data = {
			id: 1,
			customer_id: 1, 
			start_date: Date.new(2020,3,2),
			end_date: Date.new(2020,3,8),
			room_cost: 150,
			rooms: @rooms
		}
		
		@reservation = HotelManager::Reservation.new(@reservation_data)
	end

	describe "Reservation Block Class - Attributes" do

		it "is an instance of Reservation Block" do
			expect(@reservation).must_be_kind_of HotelManager::Reservation
			expect(@reservation.rooms).must_be_kind_of Array
		end

		it "raises argument if block only has one room" do
			@rooms = nil
			@reservation_data[:rooms] = @rooms
			expect{HotelManager::Reservation.new(@reservation_data)}.must_raise ArgumentError
		end

		it "raises argument if block has more than 5 rooms" do
			@rooms += [HotelManager::Room.new(id: 6)]
			@reservation_data[:rooms] = @rooms
			expect{HotelManager::Reservation.new(@reservation_data)}.must_raise ArgumentError
		end

		it "calculates total cost correctly" do
			reservation_cost = @reservation.total_cost()
			expect(reservation_cost).must_equal 3_750
		end
	end

	describe "Reservation Block Class - Date Validation" do

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

		it "raises argument error if start and end date are the same" do
			@reservation_data[:start_date] = Date.new(2020,3,5)
			@reservation_data[:end_date] = Date.new(2020,3,5)
			expect{HotelManager::Reservation.new(@reservation_data)}.must_raise ArgumentError
		end
	end	
end

# Edge case - date entered is > 31 days per month or leap year
# raise argument error if start and end date are the same

# Able to reserve a hotel block (group of rooms for a specific group of customers for a set period of time)



