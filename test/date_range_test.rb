require_relative "test_helper"

describe Hotel::DateRange do
  describe "constructor" do
    before do 
      start_date = Date.new(2017, 01, 01)
      end_date = start_date + 3

      @range = Hotel::DateRange.new(start_date, end_date)
    end 

    it "Can be initialized with two dates" do
      start_date = Date.new(2017, 01, 01)
      end_date = start_date + 3
      expect(@range.start_date).must_equal start_date
      expect(@range.end_date).must_equal end_date
    end

    it "is an an error for negative-lenght ranges" do
      start_date = Date.today
      end_date = start_date - 3
      expect { Hotel::DateRange.new(start_date, end_date) }.must_raise ArgumentError 
    end

    it "is an error to create a 0-length range" do
      start_date = Date.today
      end_date = @start_date
      expect { Hotel::DateRange.new(start_date, end_date) }.must_raise ArgumentError
    end
  end

  describe "overlap?" do
    before do
      start_date = Date.new(2017, 01, 01)
      end_date = start_date + 10

      @range = Hotel::DateRange.new(start_date, end_date)
    end

    it "returns true for the same range" do
      start_date = @range.start_date
      end_date = @range.end_date
      test_range = Hotel::DateRange.new(start_date, end_date)

      expect(@range.overlap?(test_range)).must_equal true
    end 

    it "returns true for a contained range" do
      start_date = Date.new(2017, 01, 03)
      end_date = start_date + 3 
      second_range = Hotel::DateRange.new(start_date, end_date)
      expect(@range.overlap?(second_range)).must_equal true
      
    end

    it "returns true for a range that overlaps in front" do
      start_date = Date.new(2016, 12, 27)
      end_date = @range.start_date + 1 #end of the first range should be available for second_range night 
      second_range = Hotel::DateRange.new(start_date, end_date)
      expect(@range.overlap?(second_range)).must_equal true
    end

    it "returns true for a range that overlaps in the back" do
      start_date = @range.start_date
      end_date = start_date + 4
      second_range = Hotel::DateRange.new(start_date, end_date)
      expect(@range.overlap?(second_range)).must_equal true
    end

    it "returns true for a containing range" do
      start_date = @range.start_date - 4
      end_date = @range.end_date + 3
      second_range = Hotel::DateRange.new(start_date, end_date)
      expect(@range.overlap?(second_range)).must_equal true
    end

    it "returns false for a range starting on the end_date date" do
      start_date = @range.end_date 
      end_date = start_date + 3
      second_range = Hotel::DateRange.new(start_date, end_date)
      expect(@range.overlap?(second_range)).must_equal false
    end

    it "returns false for a range ending on the start_date date" do
      start_date = Date.new(2016, 12, 27)
      end_date = @range.start_date
      second_range = Hotel::DateRange.new(start_date, end_date)
      expect(@range.overlap?(second_range)).must_equal false
    end

    it "returns false for a range completely before" do
      start_date = Date.new(2016, 12, 20)
      end_date = start_date + 5
      second_range = Hotel::DateRange.new(start_date, end_date)
      expect(@range.overlap?(second_range)).must_equal false
    end

    it "returns false for a date completely after" do
      start_date = Date.new(2017, 02, 03)
      end_date = start_date + 5
      second_range = Hotel::DateRange.new(start_date, end_date)
      expect(@range.overlap?(second_range)).must_equal false
    end
  end

  describe "nights" do
    it "returns the correct number of nights" do
      start_date = Date.new(2017, 02, 03)
      end_date = start_date + 3 
      range = Hotel::DateRange.new(start_date, end_date)
      expect(range.nights).must_equal 3

    end
  end
  describe "include_date_range?" do 
    before do 
      start_date = Date.new(2017, 01, 01)
      end_date = start_date + 3
      @range = Hotel::DateRange.new(start_date, end_date)
    end 
    it "is included in the range" do
      second_start_date = Date.new(2017, 01, 01)
      second_end_date = second_start_date + 1 
      second_range= Hotel::DateRange.new(second_start_date, second_end_date)
      expect(@range.include_date_range?(second_range)).must_equal true
    end 
    it "is not included in the range" do 
      start_date = Date.new(2016, 12, 27)
      end_date = start_date + 2 
      second_range = Hotel::DateRange.new(start_date, end_date)
      expect(@range.include_date_range?(second_range)).must_equal false
    end 
  end 


end