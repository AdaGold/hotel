require_relative '../lib/reservation'
require_relative 'spec_helper'

describe "class Reservation"  do
  before (:all) do
    @check_in = Date.new(2017,10,01)
    @check_out = Date.new(2017,10,03)
    @reservation = Hotel::Reservation.new(3, @check_in, @check_out)
  end
  describe "initialize" do
    it "creates an instance of Reservation" do
      @reservation.must_be_instance_of Hotel::Reservation
    end
  end
  describe "#price_night" do
    it "returns 200 (for each room)" do
      @reservation.price_night.must_equal 200
    end
  end
  describe "#total_cost" do
    it "must return the total cost paid for length of stay" do
      @reservation.total_cost.must_equal 400
    end
  end
end