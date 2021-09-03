def each_cons(array)
  array.each_with_index do |element, index|
    next_index = index + 1
    yield(element, array[next_index]) if next_index < array.size
  end
  nil
end

# hash = {}
# result = each_cons([1, 3, 6, 10]) do |value1, value2|
#   hash[value1] = value2
# end
# p hash
# p result == nil
# p hash == { 1 => 3, 3 => 6, 6 => 10 }

# hash = {}
# result = each_cons([]) do |value1, value2|
#   hash[value1] = value2
# end
# p hash
# p hash == {}
# p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash
p hash == {'a' => 'b'}
p result == nil