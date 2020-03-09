require_relative 'test_helper'

describe "Room Test" do
	before do
		@room_data = {
			id: 1,
		}
		@room = HotelManager::Room.new(@room_data)
	end
	
	it "is an instance of Room "do
		expect(@room).must_be_kind_of HotelManager::Room
	end
end

# 
# able to instantiate with reservation?
# able to instantiate without reservation?
