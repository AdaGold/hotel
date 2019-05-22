class Room

  # attribute accessor
  attr_accessor :number

  # Constructor! This will be called automatically when you invoke User.new
  def initialize(number)
    @number = number
  end
end
