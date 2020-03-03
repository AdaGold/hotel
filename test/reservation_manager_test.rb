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
			room_id: 1
		}
		@res_two_data = {
			id: 2,
			customer_id: 2, 
			start_date: Date.new(2020,3,15),
			end_date: Date.new(2020,3,24),
			room_cost: 200,
			room_id: 1
		}
		@res_one = HotelManager::Reservation.new(@res_one_data)
		@res_two = HotelManager::Reservation.new(@res_two_data)
		@sample_two = HotelManager::ReservationManager.new()

		@sample_two.add_reservation(@res_one)
		@sample_two.add_reservation(@res_two)
	end

	describe "ability to add reservations to the Reservation Manager" do
		it "able to add reservations to Reservation Manager" do
			expect(@sample_two.reservations.length).must_equal 2
		end

		it "open room for reservation after it's end date" do
			@res_four_data = {
				id: 4,
				customer_id: 4, 
				start_date: Date.new(2020,3,24),
				end_date: Date.new(2020,3,28),
				room_cost: 200,
				room_id: 1
			}
			
			@res_four = HotelManager::Reservation.new(@res_four_data)
			@sample_two.add_reservation(@res_four)

			expect(@sample_two.reservations.length).must_equal 3
		end

		it "raise argument error if overbooking attempted" do
			@res_five_data = {
				id: 5,
				customer_id: 5, 
				start_date: Date.new(2020,3,23),
				end_date: Date.new(2020,3,28),
				room_cost: 200,
				room_id: 1
			}
			
			@res_five = HotelManager::Reservation.new(@res_five_data)
			expect{@sample_two.add_reservation(@res_five)}.must_raise ArgumentError
		end
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
		it "able to list reservation by specific date" do
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

	# see list of rooms available for a given date range 
	describe "list rooms available by date range" do
		it "able to list out all available rooms by date range" do
			@search_result = @sample_two.list_room_by_range(Date.new(2020,4,1),Date.new(2020,4,7))
			expect(@search_result).must_be_kind_of Array
			expect(@search_result[0]).must_be_kind_of HotelManager::Room
			expect(@search_result.length).must_equal 20
		end 

		it "able to list out all available rooms by date range" do
			@search_result = @sample_two.list_room_by_range(Date.new(2020,3,1),Date.new(2020,3,5))
			expect(@search_result).must_be_kind_of Array
			expect(@search_result[0]).must_be_kind_of HotelManager::Room
			expect(@search_result.length).must_equal 19
		end 

		it "notify user if no rooms are available" do
			#complete later, need to modify hotel room # to by dynamic (user input)
		end
	end
end