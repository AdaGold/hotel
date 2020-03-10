require_relative 'test_helper'

describe "block tests" do
  before do
    @stay_begin = Date.new(2020, 5, 20)
    @stay_end = Date.new(2020, 5, 28)
    @manager = Hotel::ReservationManager.new
    @manager.new_reservation(@stay_begin, @stay_end)
    @available_rooms = @manager.room_list_by_availability(Date.new(2021, 1, 10), Date.new(2021, 1, 20))
    @block = @manager.new_block(@available_rooms[0..4], Date.new(2021, 1, 10), Date.new(2021, 1, 20), 100)
  end

  describe "initialize" do
    it "can be created" do
      expect(@block).must_be_instance_of Hotel::Block
    end

    it "has it's own provided rate" do
      expect(@block.rate).must_equal 100
    end
  end

  describe "room reservation" do
    it "a room in the block can be reserved with the block and given dates" do
      room_objects = @block.rooms.keys
      @manager.reserve_block_room(@block, Date.new(2021, 1, 10), Date.new(2021, 1, 20))
      expect(@block.rooms[room_objects[0]]).must_equal true
    end

    it "will raise an argument error if there are no rooms left to book in the block" do
      expect{
        6.times do
          @manager.reserve_block_room(@block, Date.new(2021, 1, 10), Date.new(2021, 1, 20))
        end
      }.must_raise ArgumentError
    end

    it "will raise an argument error if you try to book a room without the proper block dates" do
      expect{@manager.reserve_block_room(@block, Date.new(2020, 5, 13), Date.new(2020, 5, 30))}.must_raise ArgumentError
    end
  end
end