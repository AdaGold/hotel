require_relative 'test_helper'

describe "Reservation Class" do
	describe "initialize" do
		before do
			@reservation = HotelManager::Reservation.new()
		end

		it "is an instance of Reservation" do
			expect(@reservation).must_be_kind_of HotelManager::Reservation
		end
	end
end