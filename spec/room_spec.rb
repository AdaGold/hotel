require_relative "spec_helper.rb"

describe "Room class" do
  it "creates an instance of Room" do
    room = Hotel::Room.new(5)
    expect(room).must_be_kind_of Hotel::Room
  end

  it "raises error for non-valid number - string" do
    expect {
      Hotel::Room.new("string")
    }.must_raise ArgumentError
  end

  it "raises error for non-valid number - nil" do
    expect {
      Hotel::Room.new(nil)
    }.must_raise ArgumentError
  end
end
