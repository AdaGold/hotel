require_relative 'test_helper'

describe "room test" do
  before do
    @stay_begin = Date.new(2020, 5, 20)
    @stay_end = Date.new(2020, 5, 28)
    @manager = Hotel::ReservationManager.new
    @manager.new_reservation(@stay_begin, @stay_end)
  end

  describe "initialize" do
    it "can be be created when an instance of reservation manager is instantiated." do
      expect(@manager.rooms[0]).must_be_instance_of Hotel::Room
    end

    it "can have an array of all reservation associated with it" do
      expect(@manager.rooms[0].reservations).must_be_instance_of Array
    end

    it "will have a number" do
      expect(@manager.rooms[1].number).must_equal 2
    end
  end

  describe "room methods" do
    it "will find the reservation that matches a given date range" do
      expect(@manager.rooms[0].find_reservations(@stay_begin, @stay_end)).must_be_instance_of Hotel::Reservation
    end
  end

end