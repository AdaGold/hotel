require_relative "spec_helper.rb"

describe "HotelSystem class" do
  it "creates an instance of HotelSystem" do
    hotel = Hotel::HotelSystem.new
    expect(hotel).must_be_kind_of Hotel::HotelSystem
  end
end
