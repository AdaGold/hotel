require_relative '../lib/date_range'
require_relative 'spec_helper'

describe "class DateRange"  do
  before (:all) do
    # @date_range = Hotel::DateRange.new(3, '2017,10,10', '2017,10,17')
    @start_date = Date.new(2017,10,01)
    @end_date = Date.new(2017,10,10)
    @date_range = Hotel::DateRange.new(3, @start_date, @end_date)
  end
  describe "initialize" do
    it "creates an instance of DateRange" do
      @date_range.must_be_instance_of Hotel::DateRange
    end
  end
  describe "#date" do
    it "returns @date as an integer" do
      # @date_range = Hotel::DateRange.new(3, @start_date, @end_date)
      @start_date = Date.new(2017,10,01)
      @end_date = Date.new(2017,10,10)
      # @date_range = Hotel::DateRange.new(3,'2017,10,01', '2017,10,10')
      @date_range.date.must_be_kind_of Integer
    end
  end
end