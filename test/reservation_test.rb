require_relative "test_helper"

describe "Reservation" do
    before do
        @start_date = Date.new(2020, 2, 2)
        @end_date = @start_date + 10
        @room = "3"
        @guest_name = "Mair Heshmati"
        @reserve = Hotel::Reservation.new(@start_date, @end_date, room: @room, guest_name: @guest_name)
        @reservation_dates = Hotel::DateRange.new(@start_date, @end_date)
      end

  describe "Initialize" do
    it "should create an instance of Reservation" do
      expect(@reserve).must_be_kind_of Hotel::Reservation
    end

    it "Takes in and keeps track of the start and end date, the desired room number and guest name" do
      expect(@reserve.instance_variable_get(:@start_date)).must_equal @start_date
      expect(@reserve.instance_variable_get(:@end_date)).must_equal @end_date
      #make sure the start and end date is being set as instance variables 

      expect(@reserve).must_respond_to :room
      expect(@reserve.room).must_equal @room

      expect(@reserve).must_respond_to :guest_name
      expect(@reserve.guest_name).must_equal @guest_name
    end

    it "Should instantiate an instance of DateRange given start and end date" do 
      expect(@reserve).must_respond_to :reservation_dates
      expect(@reserve.reservation_dates).must_be_kind_of Hotel::DateRange 
    end
  end
  describe "cost" do 
    it "Calculates the correct amount of cost for reservation duration" do 
        expect(@reserve.cost).must_equal 1800
    end
    

  end
end
