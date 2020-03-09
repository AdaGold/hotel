################################
## ADAPTED FROM OO-RIDE-SHARE ##
################################

require_relative 'test_helper'

TEST_DATA_DIR = 'test/test_data'

describe 'CSV Record Class' do
  it 'is an instance of CSV Record' do
    record = HotelManager::CsvRecord.new(1)
    expect(record.id).must_equal 1
  end

  it 'raises error if invalid id is used' do
    expect {HotelManager::CsvRecord.new(-7)}.must_raise ArgumentError
    expect {HotelManager::CsvRecord.new("One")}.must_raise ArgumentError
  end

  it 'validates that id accepts natural numbers' do
    [1, 10, 9999].each {|id| HotelManager::CsvRecord.validate_id(id)}
  end

  it 'raises for negative numbers and 0' do
    [0, -1, -10, -9999].each {|id| expect { HotelManager::CsvRecord.validate_id(id) }.must_raise ArgumentError}
  end

  it 'raises for nil' do
    expect {HotelManager::CsvRecord.validate_id(nil)}.must_raise ArgumentError
  end
end

describe 'CSV Record Class - Load All' do
  it "raise argument error if invalid file path" do
    expect {HotelManager::CsvRecord.load_all}.must_raise ArgumentError
  end

  it "raises an error if missing directory or file path" do
    expect {HotelManager::CsvRecord.build_path(nil,"")}.must_raise ArgumentError
  end

  it "raises an error if invoked directly (without subclassing)" do
    full_path = "#{TEST_DATA_DIR}/testrecords.csv"
    expect {HotelManager::CsvRecord.load_all(full_path: full_path)}.must_raise NotImplementedError
  end
end

describe 'CSV Record Class - Test Class' do
  class TestRecord < HotelManager::CsvRecord
    attr_reader :call_count

    def initialize(id:, customer_id:, start_date:, end_date: , num_of_rooms:)
      super(id)
    end

    def self.load_all(*args, **kwargs)
      @call_count = 0
      super
    end

    def self.from_csv(record)
      new(**record)
      @call_count += 1
    end

    def self.call_count
      @call_count
    end
  end

  describe 'load_all' do
    file_name = 'testrecords.csv'
    record_count = CSV.read("#{TEST_DATA_DIR}/#{file_name}", headers: true).length

    it 'finds data given just a directory' do
      records = TestRecord.load_all(directory: TEST_DATA_DIR)
      expect(records.length).must_equal record_count
    end

    it 'finds data given a directory and filename' do
      records = TestRecord.load_all(directory: TEST_DATA_DIR, file_name: file_name)

      expect(records.length).must_equal record_count
    end

    it 'finds data given a full path' do
      records = TestRecord.load_all(full_path: "#{TEST_DATA_DIR}/#{file_name}")

      expect(records.length).must_equal record_count
    end

    it 'calls `from_csv` for each record in the file' do
      TestRecord.load_all(directory: TEST_DATA_DIR)
      expect(TestRecord.call_count).must_equal record_count
    end
  end
end