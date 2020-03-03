require_relative "test_helper"

describe Hotel::Room do 
  describe "Room class" do 
    it "can be created" do 
      room = Hotel::Room.new(2)
      expect(room).must_be_kind_of Hotel::Room
    end 
  end 
end 