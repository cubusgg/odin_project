# frozen_string_literal: true

def bubble_sort(array)
  loop do
    shift = false
    (0..array.length - 2).each do |i|
      next unless array[i] > array[i + 1]

      array[i], array[i + 1] = array[i + 1], array[i]
      shift = true
    end
    break unless shift
  end
  p array
end

bubble_sort([4, 3, 78, 2, 0, 2])
