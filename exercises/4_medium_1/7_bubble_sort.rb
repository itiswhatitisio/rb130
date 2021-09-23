def bubble_sort!(array)
  counter = 0
  loop do
    array.each_with_index do |el, i|
      if (i + 1) < array.size
        if block_given?
          if yield(el, array[i + 1])
            next
          else
            array[i], array[i+1] = array[i + 1], el
          end
        end
        if el > array[i + 1]
          array[i], array[i+1] = array[i + 1], el
        end
      end
    end
    counter += 1
    break if counter >= array.size
  end
  array
end

array = [5, 3, 6, 2, 4, 1]
bubble_sort!(array)
p array == [1, 2, 3, 4, 5, 6]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)