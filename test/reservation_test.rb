
require_relative 'test_helper'



describe "reservation" do
  it "initializes a reservation correctly" do 
    reservation = HotelSystem::Reservation.new(500, Date.new(2020, 03, 18), Date.new(2020, 03, 20))

    reservation.must_be_instance_of HotelSystem::Reservation
  
  end 

  it "total cost must be correct " do 
    reservation = HotelSystem::Reservation.new(500, Date.new(2020, 03, 18), Date.new(2020, 03, 21))
    cost = reservation.get_total_cost
    cost.must_equal 600
  
  end 

  it "must raise arguemnt error for invalid date " do 
    expect{HotelSystem::Reservation.new(500, Date.new(2020, 03, 01), Date.new(2020, 03, 06))}.must_raise ArgumentError
  end 
  

end