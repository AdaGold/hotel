require 'csv'
require 'pry'

module HotelManager
  class CsvRecord

    attr_reader :id

    def initialize(id)
      # self.class.validate_id(id)
      @id = id
      validate_id
    end

    def validate_id
      if @id.nil? || @id <= 0
        raise ArgumentError, 'ID cannot be blank or less than one.'
      end
    end

    def self.load_all(full_path: nil, directory: nil, file_name: nil)
      full_path ||= build_path(directory, file_name)
      
      return CSV.read(
        full_path,
        headers: true,
        header_converters: :symbol,
        converters: :numeric
      ).map { |record| from_csv(record) }
    end

    def self.from_csv(record)
      raise NotImplementedError, 'Implement me in a child class!'
    end

    def self.build_path(directory, file_name)
      raise ArgumentError, "Either full_path or directory is required" if directory.nil?
      
      unless file_name
        class_name = self.to_s.split('::').last
        file_name = "#{class_name.downcase}s.csv"
      end

      return "#{directory}/#{file_name}"
    end


  end
end