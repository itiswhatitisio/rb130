# returns a list of all of the divisors of the positive
# integer passed in as an argument.
# The return value can be in any sequence you wish.

# iterate from 1 up to the argument
# divide the number by the argument
# if the output is a whole number then, add it to the result
# repeat until the number is equal to the argument

def divisors(number)
  result = []
  (1..number).to_a.each do |num|
    if ((number.to_f / num) % 1 ).zero?
      result << num
    end
  end
  result
end

p divisors(1) == [1]
p divisors(7) #== [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute