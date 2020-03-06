require_relative 'test_helper'

describe "Reservation Manager Class" do 
	before do 
		@sample = HotelManager::ReservationManager.new()
	end

	it "is an instance of Reservation Manager" do
		expect(@sample).must_be_kind_of HotelManager::ReservationManager
		expect(@sample.rooms).must_be_kind_of Array
		expect(@sample.reservation_blocks).must_be_kind_of Array
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

describe "Reservation Manager Class - Search Functions" do
	before do
		@sample = HotelManager::ReservationManager.new()
		@sample.save_reservation(Date.new(2020,3,2),Date.new(2020,3,5))
		@sample.save_reservation(Date.new(2020,3,15),Date.new(2020,3,24))
		@sample.save_reservation(Date.new(2020,3,2),Date.new(2020,3,18),num_of_rooms:3)
	end

	describe "test search by room AND date range" do
		it "able to list reservation by room/date range" do
			@sample.save_reservation(Date.new(2020,3,6),Date.new(2020,3,12),num_of_rooms:3,room_cost:100)

			@search_result = @sample.search_by_room_date(1, Date.new(2020,3,1), Date.new(2020,3,10))
			expect(@search_result).must_be_kind_of Array
			expect(@search_result[1]).must_be_kind_of HotelManager::ReservationBlock
			expect(@search_result[0].id).must_equal 1
			expect(@search_result[1].id).must_equal 4
		end

		it "notifies user if no room by room/date range" do
			expect{@sample.search_by_room_date(1, Date.new(2020,4,1), Date.new(2020,4,10))}.must_raise ArgumentError
		end

		it "raise argument error if invalid room or date range" do
			expect{@sample.search_by_room_date(30, Date.new(2020,3,1), Date.new(2020,3,10))}.must_raise ArgumentError
			expect{@sample.search_by_room_date(1, "Date.new(2020,3,1)", Date.new(2020,3,10))}.must_raise ArgumentError
		end
	end

	describe "test search by date" do
		it "able to list reservation by specific date" do
			@search_result = @sample.search_by_date(Date.new(2020,3,17))
			expect(@search_result).must_be_kind_of Array
			expect(@search_result[0]).must_be_kind_of HotelManager::ReservationBlock
			expect(@search_result[0].id).must_equal 2
			expect(@search_result[1].id).must_equal 3
		end

		it "raise argument error if no reservation_blocks on that date" do
			expect{@sample.search_by_date(Date.new(2020,4,1))}.must_raise ArgumentError
		end

		it "raise argument error if invalid date entered" do
			expect{@sample.search_by_date("Date.new(2020,3,1)")}.must_raise ArgumentError
		end
	end

	# see list of rooms available for a given date range 
	describe "list rooms available by date range" do
		it "able to list out all available rooms by date range" do
			@search_result = @sample.list_room_by_range(Date.new(2020,4,1),Date.new(2020,4,7))
			expect(@search_result).must_be_kind_of Array
			expect(@search_result.length).must_equal 20
		end 

		it "able to list out all available rooms by date range" do
			@search_result = @sample.list_room_by_range(Date.new(2020,3,1),Date.new(2020,3,5))
			expect(@search_result).must_be_kind_of Array
			expect(@search_result[0]).must_be_kind_of HotelManager::Room
			expect(@search_result.length).must_equal 16
		end 

		it "notify user if no rooms are available" do
			@sample.save_reservation(Date.new(2020,3,2),Date.new(2020,3,18),num_of_rooms:5)
			@sample.save_reservation(Date.new(2020,3,2),Date.new(2020,3,18),num_of_rooms:5)
			@sample.save_reservation(Date.new(2020,3,2),Date.new(2020,3,18),num_of_rooms:5)
			@sample.save_reservation(Date.new(2020,3,2),Date.new(2020,3,18))
			
			expect{@sample.list_room_by_range(Date.new(2020,3,1),Date.new(2020,3,5))}.must_raise ArgumentError
		end
	end
end

describe "Reservation Manager Class - Create New Reservation" do
	before do 
		@sample = HotelManager::ReservationManager.new()
		
		@sample.save_reservation(Date.new(2020,3,1),Date.new(2020,3,5))
		@sample.save_reservation(Date.new(2020,3,1),Date.new(2020,3,5))
		@sample.save_reservation(Date.new(2020,3,1),Date.new(2020,3,5),num_of_rooms:5)
		@sample.save_reservation(Date.new(2020,3,1),Date.new(2020,3,5),num_of_rooms:4)
	end

	it "able to add reservation_blocks to Reservation Manager" do
		expect(@sample.reservation_blocks.length).must_equal 4
	end

	it "verify that next available rooms were used - individual" do
		@sample.save_reservation(Date.new(2020,3,4),Date.new(2020,3,7))
		@sample.save_reservation(Date.new(2020,3,10),Date.new(2020,3,17))
		
		expect(@sample.reservation_blocks[0].room_ids).must_equal [1]
		expect(@sample.reservation_blocks[1].room_ids).must_equal [2]
		expect(@sample.reservation_blocks[4].room_ids).must_equal [12]
		expect(@sample.reservation_blocks[5].room_ids).must_equal [1]
	end

	it "create and save reservation blocks providing only dates" do
		expect(@sample.reservation_blocks.length).must_equal 4
	end

	it "verify that next available rooms were used - block" do
		@sample.save_reservation(Date.new(2020,3,4),Date.new(2020,3,7),num_of_rooms:4)
		@sample.save_reservation(Date.new(2020,3,10),Date.new(2020,3,15),num_of_rooms:5)

		expect(@sample.reservation_blocks[2].room_ids).must_equal [3,4,5,6,7]
		expect(@sample.reservation_blocks[3].room_ids).must_equal [8,9,10,11]
		expect(@sample.reservation_blocks[4].room_ids).must_equal [12,13,14,15]
		expect(@sample.reservation_blocks[5].room_ids).must_equal [1,2,3,4,5]
	end

	it "raises arugment error if no rooms are available - individual" do
		@sample.save_reservation(Date.new(2020,3,1),Date.new(2020,3,5),num_of_rooms:5)
		@sample.save_reservation(Date.new(2020,3,1),Date.new(2020,3,5),num_of_rooms:4)

		expect{@sample.save_reservation(Date.new(2020,3,1),Date.new(2020,3,5))}.must_raise ArgumentError
	end

	it "raises arugment error if no rooms are available - block" do
		@sample.save_reservation(Date.new(2020,3,1),Date.new(2020,3,5),num_of_rooms:5)
		@sample.save_reservation(Date.new(2020,3,1),Date.new(2020,3,5),num_of_rooms:4)

		expect{@sample.save_reservation(Date.new(2020,3,1),Date.new(2020,3,5),num_of_rooms:2)}.must_raise ArgumentError
	end
end

describe "Reservation Manager Class - Double Booking" do
	before do 
		@sample = HotelManager::ReservationManager.new()
		@sample.save_reservation(Date.new(2020,3,1),Date.new(2020,3,15),num_of_rooms:5)
		@sample.save_reservation(Date.new(2020,3,1),Date.new(2020,3,15),num_of_rooms:5)
		@sample.save_reservation(Date.new(2020,3,1),Date.new(2020,3,15),num_of_rooms:5)
		@sample.save_reservation(Date.new(2020,3,1),Date.new(2020,3,15),num_of_rooms:5)
	end

	it "raise error - individual overbooking same range" do
		expect{@sample.save_reservation(Date.new(2020,3,1),Date.new(2020,3,15))}.must_raise ArgumentError
	end

	it "raise error - overbooking within range" do
		expect{@sample.save_reservation(Date.new(2020,3,2),Date.new(2020,3,14),num_of_rooms: 5)}.must_raise ArgumentError
	end

	it "raise error - overbooking outside range" do
		expect{@sample.save_reservation(Date.new(2020,2,25),Date.new(2020,4,1),num_of_rooms: 5)}.must_raise ArgumentError
	end

	it "raise error - overbooking before range" do
		expect{@sample.save_reservation(Date.new(2020,2,25),Date.new(2020,3,5),num_of_rooms: 5)}.must_raise ArgumentError
	end

	it "raise error - overbooking after range" do
		expect{@sample.save_reservation(Date.new(2020,3,8),Date.new(2020,3,20),num_of_rooms: 5)}.must_raise ArgumentError
	end

	it "allow booking overlapping last day" do
		@sample.save_reservation(Date.new(2020,3,15),Date.new(2020,3,20),num_of_rooms: 5)
		expect(@sample.reservation_blocks[4]).must_be_kind_of HotelManager::ReservationBlock
		expect(@sample.reservation_blocks.length).must_equal 5
	end
end

describe "Reservation Manager Class - Allow Booking" do
	before do 
		@sample = HotelManager::ReservationManager.new()
		@sample.save_reservation(Date.new(2020,3,1),Date.new(2020,3,15),num_of_rooms:5)
	end

	it "allow booking overlapping last day" do
		@sample.save_reservation(Date.new(2020,3,15),Date.new(2020,3,20),num_of_rooms: 5)
		expect(@sample.reservation_blocks[1]).must_be_kind_of HotelManager::ReservationBlock
		expect(@sample.reservation_blocks.length).must_equal 2
	end

	it "allow individual booking on same range" do
		@sample.save_reservation(Date.new(2020,3,1),Date.new(2020,3,15))
		expect(@sample.reservation_blocks[1]).must_be_kind_of HotelManager::ReservationBlock
		expect(@sample.reservation_blocks.length).must_equal 2
	end

	it "allow booking within range" do
		@sample.save_reservation(Date.new(2020,3,2),Date.new(2020,3,14))
		expect(@sample.reservation_blocks[1]).must_be_kind_of HotelManager::ReservationBlock
		expect(@sample.reservation_blocks.length).must_equal 2
	end

	it "allow booking outside of range" do
		@sample.save_reservation(Date.new(2020,2,25),Date.new(2020,3,18))
		expect(@sample.reservation_blocks[1]).must_be_kind_of HotelManager::ReservationBlock
		expect(@sample.reservation_blocks.length).must_equal 2
	end

	it "allow booking before range" do
		@sample.save_reservation(Date.new(2020,2,25),Date.new(2020,3,5))
		expect(@sample.reservation_blocks[1]).must_be_kind_of HotelManager::ReservationBlock
		expect(@sample.reservation_blocks.length).must_equal 2
	end

	it "allow booking after range" do
		@sample.save_reservation(Date.new(2020,3,8),Date.new(2020,3,20))
		expect(@sample.reservation_blocks[1]).must_be_kind_of HotelManager::ReservationBlock
		expect(@sample.reservation_blocks.length).must_equal 2
	end
end

# List of available rooms will not include the rooms in block reservation
# Correctly list out whether a given block has any rooms available?
# Able to reserve a specific room from a hotel block, but only for the full duration of the block (individual reservation_blocks still work?)
# List of reservation by date will list out both individual and block reservation_blocks
# Check to make sure that when a block is reserved, the indivudal room reservation dates will also be there
# Confirm that all availabilty checking logic from Wave 2 also respects room blocks

# 2 or more days overlapping (of all dates in the range)