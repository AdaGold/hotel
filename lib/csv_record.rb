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


  end
end