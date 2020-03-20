# writting a test for duration
require_relative "test_helper"

describe "date range class" do
  it "calculates duration" do
    # Arrange
    date_range_instance = DateRange.new("2020-02-27", "2020-03-02")
    # Act

    duration = date_range_instance.duration()

    # Assert
    expect (duration).must_equal 4
  end
  describe "overlap" do
    it "case 1 " do
      #Arrange
      date_one = DateRange.new("2020-03-27", "2020-04-02")
      date_two = DateRange.new("2020-04-04", "2020-04-06")
      #Act
      result = DateRange.overlap?(date_one, date_two)
      #Assert
      expect(result).must_equal(false)
    end
    it "case 2" do
      #Arrange
      date_one = DateRange.new("2020-03-27", "2020-04-02")
      date_two = DateRange.new("2020-04-02", "2020-04-03")
      #Act
      result = DateRange.overlap?(date_one, date_two)
      #Assert
      expect(result).must_equal(false)
    end
    it "case 3" do
      #Arrange
      date_one = DateRange.new("2020-03-27", "2020-04-02")
      date_two = DateRange.new("2020-04-01", "2020-04-27")
      #Act
      result = DateRange.overlap?(date_one, date_two)
      #Assert
      expect(result).must_equal(true)
    end
    it "case 4" do
      #Arrange
      date_one = DateRange.new("2020-03-27", "2020-04-02")
      date_two = DateRange.new("2020-03-27", "2020-04-02")
      #Act
      result = DateRange.overlap?(date_one, date_two)
      #Assert
      expect(result).must_equal(true)
    end
    it "case 5" do
      #Arrange
      date_one = DateRange.new("2020-03-27", "2020-04-02")
      date_two = DateRange.new("2020-03-27", "2020-04-05")
      #Act
      result = DateRange.overlap?(date_one, date_two)
      #Assert
      expect(result).must_equal(true)
    end
    it "case 6" do
      #Arrange
      date_one = DateRange.new("2020-03-17", "2020-04-05")
      date_two = DateRange.new("2020-03-06", "2020-04-05")
      #Act
      result = DateRange.overlap?(date_one, date_two)
      #Assert
      expect(result).must_equal(true)
    end
    it "case 7" do
      #Arrange
      date_one = DateRange.new("2020-04-03", "2020-04-07")
      date_two = DateRange.new("2020-04-04", "2020-04-05")
      #Act
      result = DateRange.overlap?(date_one, date_two)
      #Assert
      expect(result).must_equal(true)
    end
    it "case 8" do
      #Arrange
      date_one = DateRange.new("2020-04-03", "2020-04-05")
      date_two = DateRange.new("2020-03-31", "2020-04-07")
      #Act
      result = DateRange.overlap?(date_one, date_two)
      #Assert
      expect(result).must_equal(true)
    end
    it "case 9" do
      #Arrange
      date_one = DateRange.new("2020-03-17", "2020-04-05")
      date_two = DateRange.new("2020-03-06", "2020-03-17")
      #Act
      result = DateRange.overlap?(date_one, date_two)
      #Assert
      expect(result).must_equal(false)
    end
    it "case 10" do
      #Arrange
      date_one = DateRange.new("2020-03-17", "2020-04-05")
      date_two = DateRange.new("2020-03-06", "2020-03-19")
      #Act
      result = DateRange.overlap?(date_one, date_two)
      #Assert
      expect(result).must_equal(true)
    end
    it "case 11" do
      #Arrange
      date_one = DateRange.new("2020-05-05", "2020-05-07")
      date_two = DateRange.new("2020-03-06", "2020-03-17")
      #Act
      result = DateRange.overlap?(date_one, date_two)
      #Assert
      expect(result).must_equal(false)
    end
  end
end
