require_relative '../lib/date_range'
require_relative 'spec_helper'

describe "class DateRange"  do
  before do
    @date_range = Hotel::DateRange.new
  end
  describe "instance of DateRange class" do
    it "creates an instance of DateRange" do
      @date_range.must_be_instance_of Hotel::DateRange
    end
  end
end