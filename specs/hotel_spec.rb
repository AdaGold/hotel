require_relative '../lib/hotel.rb'
require_relative 'spec_helper'

describe "class Hotel"  do
  before do
    @hotel = Hotel::Hotel.new
  end
  describe "instance of Hotel class" do
    it "creates an instance of hotel" do
      @hotel.must_be_instance_of Hotel::Hotel
    end
  end
  describe "#collection_rooms" do
    it "returns a string of collection_rooms" do
      @hotel.collection_rooms.must_be_instance_of String
    end
  end
  describe "#collection_reservation" do
    it "returns a string of reservation" do
      @hotel.collection_reservation.must_be_instance_of String
    end
  end
end