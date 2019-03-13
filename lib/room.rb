
module Hotel
  class Room
    attr_reader :ROOM_COST

    ROOM_COST = 200 # rooms are identical at 200/night

    def initialize(number)
      @number = number

      if !@number.to_s.match /\d+/
        raise ArgumentError, "Invalid Room Number"
      end
    end
  end
end
