# first find each number on its decimal place
# if num < 4, increment to the right side
# if num == 4, subtract from 5
# if num is 5, then output 5
# if num > 5 and <9, add to the left side
# if num is 10, use the lookup table

class RomanNumerals

  NUMBERS = { 1=> 'I', 5=> 'V', 10=> 'X', 50=> 'L', 100=> 'C', 500=> 'D', 1000=> 'M'}

  def initialize(decimal)
    @decimal = decimal
  end

  def convert_to_roman
    result = []
    decimal
  end
end
  NNN = { 1=> 'I', 5=> 'V', 10=> 'X', 50=> 'L', 100=> 'C', 500=> 'D', 1000=> 'M'}


def convert_to_roman(decimal)
    result = ''
    arr = decimal.to_s.chars.map(&:to_i)
    arr.each_with_index do |num, i|
      
      if decimal/1000 > 0
        NNN[1000] * (decimal/1000)
      end

      if (decimal%1000)/100 > 0

      end
    end
end


if n < 4
  NNN[100] * n
end

if n == 4
  

p 
convert_to_roman(3453)
