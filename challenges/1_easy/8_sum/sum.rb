# input: natural number, set of one or more other numbers
# output: sum of all the multiples of the numbers in the set < number
# class and instance method

class SumOfMultiples
  def initialize(*set)
    set.empty? ? @set = default_set : @set = [*set]
  end

  def default_set
    [3, 5]
  end

  def self.to(number)
    SumOfMultiples.new.to(number)
  end

  def to(max_number)
    result = []
    (1...max_number).to_a.each do |n|
      @set.each do |i|
        result << n if (n % i == 0 && n <= max_number)
      end
    end
    result.uniq.reduce(0) { |s, n| s + n}
  end

end