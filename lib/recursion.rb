# frozen_string_literal: true

# def sort_whole(left, right, merged = [])
#   return merged if left.empty? && right.empty?

#   if left.length >= 1 && right.length >= 1
#     case left[0] <=> right[0]
#     when 1
#       merged.push(right.shift)
#       sort_whole(left, right, merged)
#     when -1
#       merged.push(left.shift)
#       sort_whole(left, right, merged)
#     when 0
#       merged.push(left.shift)
#       sort_whole(left, right, merged)
#     end
#   elsif left.empty? && right.length.positive?
#     if right.length > 1
#       case right[0] <=> right[1]
#       when 1
#         merged.push(right.delete_at(1))
#         sort_whole(left, right, merged)
#       when -1
#         merged.push(right.shift)
#         sort_whole(left, right, merged)
#       when 0
#         merged.push(right.shift)
#         sort_whole(left, right, merged)
#       end
#     else
#       merged.push(right.shift)
#       sort_whole(left, right, merged)
#     end
#   elsif right.empty? && left.length.positive?
#     if left.length > 1
#       case left[0] <=> left[1]
#       when 1
#         merged.push(left.delete_at(1))
#         sort_whole(left, right, merged)
#       when -1
#         merged.push(left.shift)
#         sort_whole(left, right, merged)
#       when 0
#         merged.push(left.shift)
#         sort_whole(left, right, merged)
#       end
#     else
#       merged.push(left.shift)
#       sort_whole(left, right, merged)
#     end
#   end
# end

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
  elsif left.empty?
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
  elsif right.empty?
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

def merge_sort(array)
  if array.length < 2
    array
  else
    l_half = merge_sort(array.take(array.length / 2))
    r_half = merge_sort(array.drop(array.length / 2))
    sort_whole(l_half, r_half)
  end
end

p merge_sort([14, 13, 16, 19, 1, 2])
p merge_sort([18, 14, 11, 1, 2, 5, 4, 16, 8, 9])
p merge_sort([20, 19, 15, 8, 18, 4, 2])
