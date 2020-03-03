require_relative "test_helper"
require 'date'

describe "date" do 
    describe "initialize" do 
        it "should create an instance of DateRange when given a start_date and end_date" do
            start_date = Date.new(2020, 2, 2)
            end_date = Date.new(2020, 2, 12)
            date = Hotel::DateRange.new(start_date, end_date)
            expect(date).must_be_kind_of Hotel::DateRange
        end 
        it "should keep track of start and end date" do 
            start_date = Date.new(2020, 2, 2)
            end_date = Date.new(2020, 2, 12)
        
            date = Hotel::DateRange.new(start_date, end_date)
            expect(date.start_date).must_equal start_date
            expect(date.end_date).must_equal end_date
        end 
        it "raises an ArgumentError if end_date is before start_date" do 
            start_date = Date.new(2020, 2, 2)
            end_date = start_date - 3
            expect{ Hotel::DateRange.new(start_date, end_date) }.must_raise ArgumentError 
        end
        it "Raises an ArgumentError for 0-length date range" do 
            start_date = Date.new(2020, 2, 2)
            end_date = start_date
            expect{ Hotel::DateRange.new(start_date, end_date) }.must_raise ArgumentError 
        end

            
    end
end