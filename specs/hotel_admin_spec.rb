require_relative 'spec_helper'

describe 'Admin Class' do
  describe 'initialize Admin' do
    it 'creates an instance of twenty rooms' do
      it 'creates a list of twenty rooms' do
        @rooms = Hotel::Room.create_rooms
        expect(@rooms.length).must_equal 20
      end
    end
  end
end 
