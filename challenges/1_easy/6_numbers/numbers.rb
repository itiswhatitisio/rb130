# Detect whether a number is perfect, abundant, or deficient.
# sum of positive divisors - Aliquot sum
# Perfect numbers have an Aliquot sum that is equal to the original number.
# Abundant numbers have an Aliquot sum that is greater than the original number.
# Deficient numbers have an Aliquot sum that is less than the original number.


class PerfectNumber
  attr_reader :number

  def initialize(n)
    @number = n
    raise StandardError.new 'The number is not a positive number' if @number < 0
  end

  def self.classify(number)
    return 'perfect' if perfect?(number)
    return 'deficient' if deficient?(number)
    return 'abundant' if abundant?(number)
  end

  def self.positive_divisors(num)
    (1...num).to_a.select { |n| num % n == 0 } 
  end

  def self.aliquot_sum(num)
    positive_divisors(num).reduce(&:+)
  end

  def self.perfect?(number)
    num = PerfectNumber.new(number)
    return true if aliquot_sum(num.number) == num.number
    false
  end

  def self.deficient?(number)
    num = PerfectNumber.new(number)
    return true if aliquot_sum(num.number) < num.number
    false
  end

  def self.abundant?(number)
    num = PerfectNumber.new(number)
    return true if aliquot_sum(num.number) > num.number
    false
  end
end