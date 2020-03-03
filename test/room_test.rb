require_relative "test_helper"

describe Hotel::Room do 
  before do 
    @room = Hotel::Room.new(2)
  end 
  describe "Room class" do 
    it "can be created" do 
      expect(@room).must_be_kind_of Hotel::Room
    end 

    it "has an Intenger ID" do 
      expect(@room.id).must_be_kind_of Integer
    end 

    it "id should be positive" do 
      room_negative_id = Hotel::Room.new(-2)
      expect(room_negative_id).must_raise ArgumentError
    end 



  end 
end 