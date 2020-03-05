
require_relative 'test_helper'



describe "reservation" do
  it "initializes a reservation correctly" do 
    reservation = HotelSystem::Reservation.new(500, Date.new(2020, 03, 04), Date.new(2020, 03, 06))

    reservation.must_be_instance_of HotelSystem::Reservation
  
  end 

  it "total cost must be correct " do 
    reservation = HotelSystem::Reservation.new(500, Date.new(2020, 03, 04), Date.new(2020, 03, 06))
    cost = reservation.get_total_cost
    cost.must_equal 400
  
  end 

  it "must raise arguemnt error for invalid date " do 
    expect{HotelSystem::Reservation.new(500, Date.new(2020, 03, 01), Date.new(2020, 03, 06))}.must_raise ArgumentError
  end 
  

end