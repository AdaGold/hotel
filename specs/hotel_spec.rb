require_relative '../lib/hotel.rb'
require_relative 'spec_helper'

describe "class Hotel"  do
  before (:all) do
    @hotel = Hotel::Hotel.new
    #@rooms = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    @res_rooms = [8, 15]
  end
  describe "instance of Hotel class" do
    it "creates an instance of hotel" do
      @hotel.must_be_instance_of Hotel::Hotel
    end
    it "must have 1-20 rooms" do
      @hotel.collection_rooms[0].must_equal 1
      @hotel.collection_rooms[19].must_equal 20
    end
  end
  describe "#collection_rooms" do
    it "returns a string of collection_rooms" do
      @hotel.collection_rooms.must_be_instance_of Array
    end
  end
  describe "#collection_reservation" do
    it "returns a string of reservation" do
      @hotel.collection_reservation.must_be_instance_of String
    end
  end
  describe "#check_if_reserved" do
    it "returns T/F if room is reserved" do
      @hotel.check_if_reserved(5).must_equal false
    end
  end
  # describe "#available_rooms" do
  #   it "returns a list of available_rooms" do
  #   @hotel.available_rooms
  #   end
  # end
end
