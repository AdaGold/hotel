class DateRange
  attr_accessor :room_status, :start_date, :end_date

  def initialize(room_status, start_date, end_date)
    @room_status = room_status
    @start_date = start_date
    @end_date = end_date
  end

def start_date("%d/%m/%Y","%k:%M" = 15:00)
@start_date = start_date
end

def end_date("%d/%m/%Y","%k:%M" = 11:00)
