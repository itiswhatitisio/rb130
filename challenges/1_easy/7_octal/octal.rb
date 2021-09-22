# octal to decimal conversion
# Input: octal input string
# Output: decimal number
# invalid output as octal 0
# Decimal is a base-10 system
# octal numbers, use a base 8 system
# 233 = 2*8^2 + 3*8^1 + 3*8^0 -> 155

class Octal
  BASE = 8

  def initialize(number)
    @number = number
  end

  def to_decimal
    result = 0
    return result if !valid_octal?
    @number.chars.map(&:to_i).reverse_each.with_index do |n, i|
      result += n * (BASE ** i)
    end
    result
  end

  def valid_octal?
    if @number.chars.include?('8') || @number.chars.include?('9') || @number.count("a-zA-Z") > 0
      return false
    else
      true
    end
  end
end

#p Octal.new('6789').to_decimal