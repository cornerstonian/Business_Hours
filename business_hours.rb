require 'time'
class BusinessHours

  attr_accessor :week

   def initialize(open,close)
      @week = {
        :mon => [open, close],
        :tues => [open, close],
        :wed => [open, close],
        :thurs => [open, close],
        :fri => [open, close],
        :sat => [open, close],
        :sun => [open, close],

      }

    end

  def update (day_date, open, close)
    # 3 arguments
    # everything inside a method must either be passed in, or declared inside the method
    # week[day_date]
    week.each do |weekday, hours_array|
      if day_date == weekday 
        hours_array[0] = open
        hours_array[1] = close
      end
    end
  end

# hours = BusinessHours.new("10:00", "3:00")
# hours.update(:mon,"7:00", "5:00")
# puts hours.inspect


  def closed(day)
    week.each do |weekday,hours_array|
      if day == weekday 
        week[weekday] = ["closed"]
       
      end
    end
  end

  def calculate_deadline(time_in_seconds, start_time)
    Time.parse(start_time) + time_in_seconds
  end
end

  
hours = BusinessHours.new("9:00AM", "10:00AM")
hours.calculate_deadline(2*60*60, "Jun 7, 2010 9:10 
