# first find each number on its decimal place
# if num < 4, increment to the right side
# if num == 4, subtract from 5
# if num is 5, then output 5
# if num > 5 and <9, add to the left side
# if num is 10, use the lookup table

class RomanNumeral
  attr_accessor :number

  NUMBERS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
    }

  def initialize(decimal)
    @decimal = decimal
  end

  def to_roman
    result = ''
    to_convert = @decimal

    NUMBERS.each do |letter, number|
      multiplier, remainder = to_convert.divmod(number)
      if multiplier > 0
        result += (letter * multiplier)
      end
      to_convert = remainder
    end
    result
  end
end