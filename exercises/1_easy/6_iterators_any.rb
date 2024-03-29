# def each(array)
#   index = 0
#   if block_given?
#     while index < array.size
#       yield(array[index])
#       index += 1
#     end
#   end

#   array
# end

def any?(array)
  index = 0
  if block_given?
    while index < array.size
      return true if yield(array[index])
      index += 1
    end
    false
  end
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false