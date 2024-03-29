# Write a method that takes a sorted array of integers as an argument,
# and returns an array that includes all of the missing integers 
# (in order) between the first and last elements of the argument.

# take the first and last integer from the array
# convert it to range
# convert it to array
# compare the new array wiht the original array
# extract the missing numbers from the new array

def missing(array)
  (array.first..array.last).to_a - array
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []