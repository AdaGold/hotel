require "date"

require_relative "spec_helper.rb"

describe "Reservation class" do
  it "creates an instance of Reservation" do
    start_date = Date.new(2019, 3, 15)
    end_date = Date.new(2019, 3, 18)
    booking = Hotel::Reservation.new(start_date, end_date)
    expect(booking).must_be_kind_of Hotel::Reservation
  end
end
