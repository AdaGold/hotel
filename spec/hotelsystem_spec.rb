require_relative "spec_helper.rb"

describe "HotelSystem class" do
  it "creates an instance of HotelSystem" do
    hotel = Hotel::HotelSystem.new
    expect(hotel).must_be_kind_of Hotel::HotelSystem
  end

  it "creates an array of rooms" do
    hotel = Hotel::HotelSystem.new
    expect(hotel.list_rooms).must_be_kind_of Array
  end
end
