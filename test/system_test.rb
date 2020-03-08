require "date"

require "simplecov"
SimpleCov.start

require_relative "test_helper"

describe "System class" do
  it "gets lists of rooms" do
    #Arrange
    system = Hotel::System.new(20)

    #Act
    rooms = system.rooms

    #Assert
    expect(rooms).must_equal (1..20).to_a
  end

  it "create reservation" do
    #Arrange
    system = Hotel::System.new(20)
    #Act
    system.create_reservation("01/01/2020", "01/10/2020")
    #Assert
    expect(system.reservations.length).must_equal 1
  end

  it "gets list of reservation and given a date" do
    #   #Arrange
    date = Date.parse ("02/02/2020")
    system = Hotel::System.new(20)
    system.create_reservation("03/12/2020", "03/12/2020")
    system.create_reservation("02/02/2020", "02/04/2020")

    #   #Act
    res_array = system.search_by_date(date)

    #   #Assert
    expect(res_array.length).must_equal 1
  end
end
