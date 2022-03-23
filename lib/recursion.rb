# frozen_string_literal: true

def sort_half(array, merged = [])
  return merged if array.nil? || array.empty?

  if array.length > 1
    case array[0] <=> array[1]
    when 1
      merged.push(array.delete_at(1))
      sort_half(array, merged)
    when -1
      merged.push(array.shift)
      sort_half(array, merged)
    when 0
      merged.push(array.shift)
      sort_half(array, merged)
    end
  else
    merged.push(array.shift)
    sort_half(array, merged)
  end
end

def sort_whole(left, right, merged = [])
  return merged if left.empty? && right.empty?

  if left.length >= 1 && right.length >= 1
    case left[0] <=> right[0]
    when 1
      merged.push(right.shift)
      sort_whole(left, right, merged)
    when -1
      merged.push(left.shift)
      sort_whole(left, right, merged)
    when 0
      merged.push(left.shift)
      sort_whole(left, right, merged)
    end
  elsif left.empty? && right.length.positive?
    if right.length > 1
      case right[0] <=> right[1]
      when 1
        merged.push(right.delete_at(1))
        sort_whole(left, right, merged)
      when -1
        merged.push(right.shift)
        sort_whole(left, right, merged)
      when 0
        merged.push(right.shift)
        sort_whole(left, right, merged)
      end
    else
      merged.push(right.shift)
      sort_whole(left, right, merged)
    end
  elsif right.empty? && left.length.positive?
    if left.length > 1
      case left[0] <=> left[1]
      when 1
        merged.push(left.delete_at(1))
        sort_whole(left, right, merged)
      when -1
        merged.push(left.shift)
        sort_whole(left, right, merged)
      when 0
        merged.push(left.shift)
        sort_whole(left, right, merged)
      end
    else
      merged.push(left.shift)
      sort_whole(left, right, merged)
    end
  end
end

def merge_sort(num)
  if num.length < 2
    num
  else
    l_half = sort_half(merge_sort(num.take(num.length / 2)))
    r_half = sort_half(merge_sort(num.drop(num.length / 2)))
    sort_whole(l_half, r_half)
  end
end

# p merge_sort([14, 13, 16, 19, 1, 2])
p merge_sort([18, 14, 11, 1, 2, 5, 4, 16, 8, 9])
