# raven, finch, *raptors = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p raptors  # => ['hawk','eagle']

def group(array)
  yield([array[0], array[1], array.slice(2..array.size)])
end

a,b,c = group(%w(raven finch hawk eagle)) { |array| p array }
p a
p b
p c