require_relative "test_helper"

describe "DateRange" do
  before do
    @start_date = Date.new(2020, 2, 2)
    @end_date = Date.new(2020, 2, 5)
    @date = Hotel::DateRange.new(@start_date, @end_date)
    @all_dates = [Date.new(2020, 2, 2), Date.new(2020, 2, 3), Date.new(2020, 2, 4)]
  end

  describe "initialize" do
    it "Should create an instance of DateRange when given a start_date and end_date" do
      expect(@date).must_be_instance_of Hotel::DateRange
    end
    it "Should keep track of start and end date" do
      expect(@date.start_date).must_equal @start_date
      expect(@date.end_date).must_equal @end_date
    end
    it "Raises an ArgumentError if end_date is before start_date" do
      start_date = Date.new(2020, 2, 2)
      end_date = start_date - 3
      expect { Hotel::DateRange.new(start_date, end_date) }.must_raise ArgumentError
    end
    it "Raises an ArgumentError for 0-length date range" do
      start_date = Date.new(2020, 2, 2)
      end_date = start_date
      expect { Hotel::DateRange.new(start_date, end_date) }.must_raise ArgumentError
    end
  end

  describe "duration" do
    it "Should have the .duration method" do
      expect(@date).must_respond_to :duration
    end

    it "Should calculate the correct amount of durations" do
      expect(@date.duration).must_equal 3
    end
  end

  describe "all_dates" do
    it "Should have the .all_dates method" do
      expect(@date).must_respond_to :all_dates
    end

    it "Should iterate through date range and give an array of all dates" do
      expect(@date.all_dates).must_equal @all_dates
    end

    it "Should give an array of all the dates within the date range" do
      expect(@date.all_dates).must_be_kind_of Array
    end

    it "Should include date that exists within date range" do
      expect(@date.all_dates).must_include Date.new(2020, 2, 3)
    end

    it "Should not include the departure date" do
      expect(@date.all_dates).wont_include @end_date
    end

    it "Should include the arrival date" do
      expect(@date.all_dates).must_include @start_date
    end
  end
end
