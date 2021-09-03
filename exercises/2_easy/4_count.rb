def count(*args)
  counter = 0
  args.each do |element|
    counter += 1 if yield(element)
  end
  counter
end

count(1, 3, 6) { |value| value.odd? } == 2
count(1, 3, 6) { |value| value.even? } == 1
count(1, 3, 6) { |value| value > 6 } == 0
count(1, 3, 6) { |value| true } == 3
count() { |value| true } == 0
count(1, 3, 6) { |value| value - 6 } == 3

# Usinng *args in the method definition;
# lets us treat the list of arguments as an Array of values, 
# which means the rest of our count method does not need to change
# (other than the change in variable name).

