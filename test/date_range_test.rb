require_relative "test_helper"

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
      #arrange
      start_date = Date.new(2017, 01, 01)
      end_date = start_date  - 3
       #act #assert
       
      expect {Hotel::DateRange.new(start_date, end_date)}.must_raise ArgumentError

    end

    it "is an error to create a 0-length range" do
      #arrange
      start_date = Date.new(2017, 01, 01)
      end_date = start_date  
      #Act #assert
      expect {Hotel::DateRange.new(start_date, end_date)}.must_raise ArgumentError
    end
  end

#############################################

  describe "overlap?" do
    before do
      start_date = Date.new(2017, 01, 01)
      end_date = start_date + 3

      @range = Hotel::DateRange.new(start_date, end_date)
    end

    it "returns true for the same range" do
      start_date = @range.start_date
      end_date = @range.end_date

      expect(@range.overlap?(start_date, end_date)).must_equal true
    end

    it "returns true for a contained range" do
      #arrange
      start_date = Date.new(2017, 01, 01)
      end_date = Date.new(2017, 01, 05)
      test_start_date = Date.new(2017, 01, 03)
      test_end_date = Date.new(2017, 01, 04)
      #act
      @range = Hotel::DateRange.new(start_date, end_date)
      #assert
      expect(@range.overlap?(test_start_date, test_end_date)).must_equal true
    end

    it "returns true for a range that overlaps in front" do 
      start_date = Date.new(2017, 01, 01)
      end_date = Date.new(2017, 01, 04)
      test_start_date = Date.new(2017, 01, 01)
      test_end_date = Date.new(2017, 01, 8)
      #act
      @range = Hotel::DateRange.new(start_date, end_date)
      #assert
      expect(@range.overlap?(test_start_date, test_end_date)).must_equal true
    end
    it "returns true for a range that overlaps  when the new_start_date is in the middle" do 
      start_date = Date.new(2017, 01, 01)
      end_date = Date.new(2017, 01, 04)
      test_start_date = Date.new(2017, 01, 03)
      test_end_date = Date.new(2017, 01, 8)
      #act
      @range = Hotel::DateRange.new(start_date, end_date)
      #assert
      expect(@range.overlap?(test_start_date, test_end_date)).must_equal true
    end

    it "returns true for a range that overlaps  when the new_end_date is before end date" do 
      start_date = Date.new(2017, 01, 01)
      end_date = Date.new(2017, 01, 03)
      test_start_date = Date.new(2016, 12, 30)
      test_end_date = Date.new(2017, 01, 03)
      #act
      @range = Hotel::DateRange.new(start_date, end_date)
      #assert
      expect(@range.overlap?(test_start_date, test_end_date)).must_equal true
    end

    it "returns true for a range that overlaps in the back" do
      start_date = Date.new(2017, 01, 01)
      end_date = Date.new(2017, 01, 05)
      test_start_date = Date.new(2017, 01, 03)
      test_end_date = Date.new(2017, 01, 05)
      #act
      @range = Hotel::DateRange.new(start_date, end_date)
      #assert
      expect(@range.overlap?(test_start_date, test_end_date)).must_equal true
    end

    it "returns true for a containing range" do                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
      start_date = Date.new(2017, 01, 03)
      end_date = Date.new(2017, 01, 04)
      test_start_date = Date.new(2017, 01, 01)
      test_end_date = Date.new(2017, 01, 05)
      #act
      @range = Hotel::DateRange.new(start_date, end_date)
      #assert
      expect(@range.overlap?(test_start_date, test_end_date)).must_equal true
    end

    it "returns true for a range starting on the end_date date" do # check later
      start_date = Date.new(2017, 01, 01)
      end_date = Date.new(2017, 01, 05)
      test_start_date = Date.new(2017, 01, 05)
      test_end_date = Date.new(2017, 01, 8)
      #act
      @range = Hotel::DateRange.new(start_date, end_date)
      #assert
      expect(@range.overlap?(test_start_date, test_end_date)).must_equal true
    end


    it "returns true for a range ending on the start_date date" do
      start_date = Date.new(2017, 01, 01)
      end_date = Date.new(2017, 01, 05)
      test_start_date = Date.new(2016, 12, 28)
      test_end_date = Date.new(2017, 01, 01)
      #act
      @range = Hotel::DateRange.new(start_date, end_date)
      #assert
      expect(@range.overlap?(test_start_date, test_end_date)).must_equal true
    end

    it "returns false for a range completely before" do
      #arrange
      start_date = Date.new(2017, 01, 01)
      end_date = Date.new(2017, 01, 03)
      test_start_date = Date.new(2016, 12, 25)
      test_end_date = Date.new(2016, 12, 30)
      # act 
      @range = Hotel::DateRange.new(start_date, end_date)
      #assert
      expect(@range.overlap?(test_start_date, test_end_date)).must_equal false
    end

    it "returns false for a date completely after" do
       #arrange
       start_date = Date.new(2017, 01, 01)
       end_date = Date.new(2017, 01, 03)
       test_start_date = Date.new(2018, 07, 2)
       test_end_date = Date.new(2018, 07, 06)
       # act 
       @range = Hotel::DateRange.new(start_date, end_date)
       #assert
       expect(@range.overlap?(test_start_date, test_end_date)).must_equal false
    end
  end


###################################################

  describe "include?" do
    it "returns false if the date is clearly out" do
       #arrange
       start_date = Date.new(2017, 01, 01)
       end_date = Date.new(2017, 01, 04)
       test_date = Date.new(2017, 01, 07)
       #act
       range = Hotel::DateRange.new(start_date, end_date)
        does_include = range.include?(test_date)
 
       #assert
       expect(does_include).must_equal false
    end

    it "returns true for dates in the range" do
      #arrange
      start_date = Date.new(2017, 01, 01)
      end_date = Date.new(2017, 01, 04)
      test_date = Date.new(2017, 01, 02)
      #act
      range = Hotel::DateRange.new(start_date, end_date)
      does_include = range.include?(test_date)

      #assert
      expect(does_include).must_equal true
    end

    it "returns false for the end_date date" do
      #arrange
      start_date = Date.new(2017, 01, 01)
      end_date = Date.new(2017, 01, 04)
      test_date = Date.new(2017, 01, 04)
      #act
      range = Hotel::DateRange.new(start_date, end_date)
      does_include = range.include?(test_date)

      #assert
      expect(does_include).must_equal false
    end
  end
  

  describe "nights" do
    it "returns the correct number of nights" do
      #arrange
      start_date = Date.new(2017, 01, 01)
      end_date = start_date + 3
      #act
      range = Hotel::DateRange.new(start_date, end_date)
      nights = range.nights

      #assert
      expect(nights).must_equal 3
    end
  end
  
end