
require 'date'

class Meetup
  attr_reader :year, :month, :days, :calendar

  DESCRIPTIONS = {
    'first' => 1,
    'second' => 2,
    'third' => 3,
    'fourth' => 4,
    'fifth' => 5
  }

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, schedule)
    @weekday = weekday.downcase
    @schedule = schedule.downcase
    find_date
  end

  def generate_calendar
    @calendar = {}
    start_date = Date.new(year, month, 1)
    end_date = Date.new(@year, @month, -1)
    i = 1
    (start_date..end_date).to_a.each do |date|
      day = Date.parse(date.strftime('%d %b %Y')).strftime('%A').downcase
      @calendar[i] = [day, date]
      i += 1
    end
    @calendar
  end

  def find_date
    generate_calendar
    filter_days
    date = nil
    
    if @schedule == 'teenth'
      @days.each do |weekday|
        date = weekday[1][1] if weekday[0] > 12 && weekday[0] < 20
        break if weekday[0] > 12 && weekday[0] < 20
      end
    elsif @schedule == 'last'
      date = @days.last[1][1]
    else
      index = DESCRIPTIONS[@schedule] - 1
      return date if @days.size <= 4 && @schedule == 'fifth'

      date = @days[index][1][1]
    end
    date
  end

  def filter_days
    @days = []
    @calendar.each do |day|
      @days << day if day[1][0] == @weekday
    end
    @days
  end
end
