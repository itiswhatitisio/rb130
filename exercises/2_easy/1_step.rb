def step(start, end_value, step_value)
  current_value = start
  if block_given?
    until current_value > end_value
      yield(current_value)
      current_value += step_value
    end
  end
  current_value
end

step(1, 10, 3) { |value| puts "value = #{value}" }