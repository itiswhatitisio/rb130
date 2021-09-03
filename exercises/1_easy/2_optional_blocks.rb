# def compute
#   return yield if block_given?
#   'Does not compute.'
# end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

## Further Exploration

def compute(data)
  return yield(data) if block_given?
  'Does not compute.'
end

compute('test') { |n| puts n }
compute(1) { |n| puts (n + 10) }
compute('hello')