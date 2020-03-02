require_relative 'test_helper'

describe "Reservation Manager Class" do 
	before do 
		@sample = HotelManager::ReservationManager.new()
	end

	it "is an instance of Reservation" do
		expect(@sample).must_be_kind_of HotelManager::ReservationManager
		expect(@sample.rooms).must_be_kind_of Array
		expect(@sample.reservations).must_be_kind_of Array
	end

	it "confirm that hotel contains 20 rooms" do
		expect(@sample.rooms.length).must_equal 20
	end

	it "able to list out all rooms in the hotel" do
		expect(@sample.rooms_list()).must_be_kind_of String
		expect(@sample.rooms_list()).must_include "Room: 1, Room: 2, Room: 3"
		expect(@sample.rooms_list()).must_include "Room: 19, Room: 20"
	end
end

describe "Reservation Manager Class - Manipulation" do
	before do
		@res_one_data = {
			id: 1,
			customer_id: 1, 
			start_date: Date.new(2020,3,2),
			end_date: Date.new(2020,3,5),
			room_cost: 200,
			room: 1
		}
		@res_two_data = {
			id: 2,
			customer_id: 2, 
			start_date: Date.new(2020,3,15),
			end_date: Date.new(2020,3,24),
			room_cost: 200,
			room: 1
		}
		@res_one = HotelManager::Reservation.new(@res_one_data)
		@res_two = HotelManager::Reservation.new(@res_two_data)
		@sample_two = HotelManager::ReservationManager.new()

		@sample_two.add_reservation(@res_one)
		@sample_two.add_reservation(@res_two)
	end

	it "able to add reservations to Reservation Manager" do
		expect(@sample_two.reservations.length).must_equal 2
	end

	describe "test search by room AND date range" do
		it "able to list reservation by room/date range" do
			@search_result = @sample_two.search_by_room_date(1, Date.new(2020,3,1), Date.new(2020,3,10))
			expect(@search_result).must_be_kind_of Array
			expect(@search_result[0]).must_be_kind_of HotelManager::Reservation
			expect(@search_result[0].id).must_equal 1
		end

		it "raise argument error if no room by room/date range" do
			@search_result = @sample_two.search_by_room_date(1, Date.new(2020,4,1), Date.new(2020,4,10))
			expect(@search_result).must_include "No reservations found within date range."
		end

		it "raise argument error if invalid room or date range" do
			expect{@sample_two.search_by_room_date(30, Date.new(2020,3,1), Date.new(2020,3,10))}.must_raise ArgumentError
			expect{@sample_two.search_by_room_date(1, "Date.new(2020,3,1)", Date.new(2020,3,10))}.must_raise ArgumentError
		end
	end

	
	describe "test search by date" do
		it "able to list reservation by room/date range" do
			
			@search_result = @sample_two.search_by_date(Date.new(2020,3,17))
			expect(@search_result).must_be_kind_of Array
			expect(@search_result[0]).must_be_kind_of HotelManager::Reservation
			expect(@search_result[0].id).must_equal 2
		end

		it "raise argument error if no reservations on that date" do
			@search_result = @sample_two.search_by_date(Date.new(2020,4,1))
			expect(@search_result).must_include "No reservations found within date range."
		end

		it "raise argument error if invalid date entered" do
			expect{@sample_two.search_by_date("Date.new(2020,3,1)")}.must_raise ArgumentError
		end
	end

end

# 
# 
# access list of reservations for specific date
# call on total cost for givien reservation (from reservation class)