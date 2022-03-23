# frozen_string_literal: true

def sort(array, merged = [])
  return merged if array.nil? || array.empty?

  if array.length > 1
    case array[0] <=> array[1]
    when 1
      merged.push(array.delete_at(1))
      sort(array, merged)
    when -1
      merged.push(array.shift)
      sort(array, merged)
    when 0
      merged.push(array.shift)
      sort(array, merged)
    end
  else
    merged.push(array.shift)
    sort(array, merged)
  end
end

def merge_sort(num)
  if num.length < 2
    num
  else
    l_half = sort(merge_sort(num.take(num.length / 2)))
    r_half = sort(merge_sort(num.drop(num.length / 2)))
    l_half + r_half
  end
end

p merge_sort([14, 13, 16, 19, 1, 2])
