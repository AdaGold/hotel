require_relative '../lib/hotel.rb'
require_relative 'spec_helper'

describe "class Hotel"  do
  before (:all) do
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
  describe "#check_if_reserved" do
    it "returns T/F if room is reserved" do
      @hotel.check_if_reserved(5).must_equal false
    end
  end
end


# describe "class DateRange"  do
#   before (:all) do
#     # @date_range = Hotel::DateRange.new(3, '2017,10,10', '2017,10,17')
#     @start_date = Date.new(2017,10,01)
#     @end_date = Date.new(2017,10,10)
#     @date_range = Hotel::DateRange.new(3, @start_date, @end_date)
#   end