require_relative "test_helper"

describe "Reservation" do
  describe "Initialize" do
    before do
      @start_date = Date.new(2020, 2, 2)
      @end_date = @start_date + 10
      @room = ["3"]
      @guest_name = "Mair Heshmati"
      @reserve = Hotel::Reservation.new(@start_date, @end_date, room: @room, guest_name: @guest_name)
    end

    it "should create an instance of Reservation" do
      expect(@reserve).must_be_kind_of Hotel::Reservation
    end

    it "Takes in and keeps track of the start and end date, the desired room number and guest name" do
      expect(@reserve).must_respond_to :start_date
      expect(@reserve.start_date).must_equal @start_date

      expect(@reserve).must_respond_to :end_date
      expect(@reserve.end_date).must_equal @end_date

      expect(@reserve).must_respond_to :room
      expect(@reserve.room).must_equal @room

      expect(@reserve).must_respond_to :guest_name
      expect(@reserve.guest_name).must_equal @guest_name
    end
    it "Should check the data type of each attribute" do 
        # expect(@reserve.start_date).must_be_kind_of Date #must make sure it's an instance of Date in method as well 
        # expect(@reserve.end_date).must_be_kind_of Date

        expect(@reserve.room).must_be_kind_of Array
        expect(@reserve.guest_name).must_be_kind_of String 
    end
  end
end
