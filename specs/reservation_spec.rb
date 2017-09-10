require_relative '../lib/reservation'
require_relative 'spec_helper'

describe "class DateRange"  do
  before (:all) do
    @check_in = Date.new(2017,10,01)
    @check_out = Date.new(2017,10,10)
    @reservation = Hotel::Reservation.new(3, @check_in, @check_out)
  end
 describe "initialize" do
    it "creates an instance of Reservation" do
      @reservation.must_be_instance_of Hotel::Reservation
    end
  end
end