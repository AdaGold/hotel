require 'date'

require_relative 'reservation_manager'
require_relative 'reservation'

module Hotel
  class Room

    attr_reader :number, :reservations, :block_reservations, :is_block_claimed

    def initialize(number)
      @number = number
      @reservations = []
    end

    def available?(stay_begin, stay_end)
      overlapping_reservations = self.reservations.select { |reservation| reservation.overlapping?(stay_begin, stay_end)}

      if overlapping_reservations.length > 0
        return false
      else
        return true
      end
    end

    def find_reservations(first, last)
      matching_reservation = @reservations.select { |reservation| reservation.overlapping?(first, last)}
      if matching_reservation.length > 0
        return matching_reservation[0]
      else
        return nil
      end
    end

  end
end