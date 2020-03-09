module HotelSystem 
  class RoomBlock

    attr_accessor :block
    
    def initialize(block, discount_rate)
      if @block.length > 5 
        raise ArgumentError.new("you can't reserve more than 5 rooms in a block")
      end 
      @block = block #array or rooms
      @cost_per_night = (@block.length * 200) - ((@block.length) * 200) * ((@discount_rate/100) )
    end 
  end 



end 