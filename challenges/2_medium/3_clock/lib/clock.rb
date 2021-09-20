class Clock
  attr_accessor :hours, :minutes, :total_minutes

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
    @total_minutes = hours * 60 + minutes
  end

  def self.at(hours, minutes = 0)
    new(hours, minutes)
  end

  def to_s
    @hours = @total_minutes / 60
    @minutes = @total_minutes % 60
    "#{format('%02d', @hours)}:#{format('%02d', @minutes)}"
  end

  def -(other)
    @total_minutes = (@total_minutes - other) % 1440
    convert_time
  end

  def +(other)
    @total_minutes = (@total_minutes + other) % 1440
    convert_time
  end

  def convert_time
    @hours = @total_minutes / 60
    @minutes = @total_minutes % 60
    Clock.new(@hours, @minutes)
  end

  def ==(other)
    hours == other.hours && minutes == other.minutes
  end
end
