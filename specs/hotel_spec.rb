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
end