require_relative 'spec_helper'

describe 'Reservation Class' do
  describe 'initialize a reservation' do
    it 'creates an instance of a reservation' do
      test_reservation = Reservation::ReserveRoom.new(:Available, '09/20/18', '09/22/18')
      expect(test_reservation).must_be_kind_of Reservation::ReserveRoom
    end
  end
end
