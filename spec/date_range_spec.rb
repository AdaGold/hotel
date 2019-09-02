require_relative "spec_helper"

describe Hotel::DateRange do
  describe "consructor" do
    it "Can be initialized with two dates" do
      start_date = Date.new(2017, 01, 01)
      end_date = start_date + 3

      range = Hotel::DateRange.new(start_date, end_date)

      expect(range.start_date).must_equal start_date
      expect(range.end_date).must_equal end_date
    end

    it "is an an error for negative-lenght ranges" do
      start_date = Date.new(2017, 01, 01)
      end_date = start_date - 3

      expect{Hotel::DateRange.new(start_date, end_date)}.must_raise ArgumentError
    end

    it "is an error to create a 0-length range" do
      start_date = Date.new(2017, 01, 01)
      end_date = start_date

      expect{Hotel::DateRange.new(start_date, end_date)}.must_raise ArgumentError
    end
  end

  describe "overlap?" do
    before do
      start_date = Date.new(2017, 01, 01)
      end_date = start_date + 3

      @range = Hotel::DateRange.new(start_date, end_date)
    end

    it "returns true for the same range" do
      start_date = @range.start_date
      end_date = @range.end_date
      test_range = Hotel::DateRange.new(start_date, end_date)

      expect(@range.overlap?(test_range)).must_equal true
    end

    it "returns true for a contained range" do
      start_date = @range.start_date+1
      end_date = @range.end_date-1
      test_range = Hotel::DateRange.new(start_date, end_date)

      expect(@range.overlap?(test_range)).must_equal true
    end

    it "returns true for a range that overlaps in front" do
      start_date = @range.start_date+1
      end_date = @range.end_date+5
      test_range = Hotel::DateRange.new(start_date, end_date)

      expect(@range.overlap?(test_range)).must_equal true
    end

    it "returns true for a range that overlaps in the back" do
      start_date = @range.start_date-5
      end_date = @range.end_date-1
      test_range = Hotel::DateRange.new(start_date, end_date)

      expect(@range.overlap?(test_range)).must_equal true
    end

    it "returns true for a containing range" do
      start_date = @range.start_date-5
      end_date = @range.end_date+5
      test_range = Hotel::DateRange.new(start_date, end_date)

      expect(@range.overlap?(test_range)).must_equal true
    end

    it "returns false for a range starting on the end_date date" do
      start_date = @range.end_date
      end_date = @range.end_date + 5
      test_range = Hotel::DateRange.new(start_date, end_date)

      expect(@range.overlap?(test_range)).must_equal false
    end

    it "returns false for a range ending on the start_date date" do
      start_date = @range.start_date-5
      end_date = @range.start_date
      test_range = Hotel::DateRange.new(start_date, end_date)

      expect(@range.overlap?(test_range)).must_equal false
    end

    it "returns false for a range completely before" do
      start_date = @range.start_date-5
      end_date = @range.start_date-2
      test_range = Hotel::DateRange.new(start_date, end_date)

      expect(@range.overlap?(test_range)).must_equal false
    end

    it "returns false for a date completely after" do
      start_date = @range.end_date + 1
      end_date = @range.end_date + 5
      test_range = Hotel::DateRange.new(start_date, end_date)

      expect(@range.overlap?(test_range)).must_equal false
    end
  end

  describe "include?" do
    before do
      start_date = Date.new(2017, 01, 01)
      end_date = start_date + 3

      @range = Hotel::DateRange.new(start_date, end_date)
    end

    it "reutrns false if the date is clearly out" do
      date = @range.end_date + 5
      expect(@range.include?(date)).must_equal false
    end

    it "returns true for dates in the range" do
      date1 = @range.start_date
      date2 = @range.start_date+1
      expect(@range.include?(date1)).must_equal true
      expect(@range.include?(date2)).must_equal true
    end

    it "returns false for the end_date date" do
      date = @range.end_date
      expect(@range.include?(date)).must_equal false
    end
  end

  describe "nights" do
    it "returns the correct number of nights" do
      start_date = Date.new(2017, 01, 01)
      end_date = start_date + 3

      range = Hotel::DateRange.new(start_date, end_date)

      expect(range.nights).must_equal 3
    end
  end
end
