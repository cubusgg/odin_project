# frozen_string_literal: true

def stock_picker(array, result = [])
  max_diff = 0
  array.each_with_index do |i, id_i|
    array.each_with_index do |j, id_j|
      if id_i < id_j && max_diff < j - i
        max_diff = j - i
        result = [id_i, id_j]
      end
    end
  end
  p result
end

stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
