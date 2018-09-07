require_relative 'spec_helper'

describe 'Reservation Class' do
  describe 'initialize a reservation' do
    it 'creates an instance of a reservation' do
      test_reservation = Reservation::ReserveRoom.new(:Available, '09/20/18', '09/22/18')
      expect(test_reservation).must_be_kind_of Reservation::ReserveRoom
    end
  end
  it 'can caluclate the cost of a reservation' do
    end_date = Date.parse('22/09/2018')
    start_date = Date.parse('20/09/2018')
    num_nights = (end_date - start_date).to_i
    room_cost = num_nights * 200
    expect(room_cost).must_equal 400
  end
  # it 'can see a list of reservations for a specific date' do
  #
  # end
end
