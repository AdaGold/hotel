require_relative "spec_helper.rb"

describe "Reservation class" do
  it "creates an instance of Reservation" do
    booking = Hotel::Reservation.new
    expect(booking).must_be_kind_of Hotel::Reservation
  end
end
