require_relative '../lib/date_range'
require_relative 'spec_helper'

describe "class DateRange"  do
  before do
    @date_range = Hotel::DateRange.new(@room_number, @start_date, @end_date)
  end
  describe "initialize" do
    it "creates an instance of DateRange" do
      @date_range.must_be_instance_of Hotel::DateRange
    end
  end
end