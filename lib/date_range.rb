class DateRange
  attr_accessor :room_status, :start_date, :end_date

def res_start(start_time = '11:00'.strftime('%k%M'))
  @res_start = res_start
end
def res_end(end_time = '15:00'.strftime('%k%M'))
  @res_end = res_end
end

  def start_date_time(date, start_time)
    @start_date = DateTime.new.res_start
  end

  def end_date_time(date, end_time)
    @end_date = DateTime.new.res_end
  end

  def initialize(room_number, room_status, start_date_time, end_date_time)
    @room_status = room_status
    @start_date = start_date
    @end_date = end_date
  end
end
