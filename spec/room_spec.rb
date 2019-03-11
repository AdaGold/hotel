require_relative "spec_helper.rb"

describe "Room class" do
  it "creates an instance of Room" do
    room = Hotel::Room.new(5)
    expect(room).must_be_kind_of Hotel::Room
  end
end
