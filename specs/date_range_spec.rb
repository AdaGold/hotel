require_relative 'spec_helper'

describe 'DateRange Class' do
  describe 'initialize date_range' do
    it 'is an instance of date_range' do
      test_date_range = DateRange.new(1, :Available, '09/20/18', '09/22/18')
    end
  end
end
