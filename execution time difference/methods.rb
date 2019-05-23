
# #O(n^2)
# def my_min(list)
#   smallest = 0
#   (0...list.length).each do |i|
#     (0...list.length).each do |j|
#       if list[i] < list[j] && list[i] < smallest
#         smallest = list[i]
#       end
#     end
#   end
#   smallest
# end

# #O(n)
# def my_min(list)
#   smallest = list.first
#   (1...list.length).each do |i|
#     smallest = list[i] if list[i] < smallest
#   end
#   smallest
# end

# # O(n^2)
# def largest_contiguous_subsum(list)
#   arr = []
#   list.each_with_index do |ele, idx|
#     (idx...list.length).each do |subidx|
#       arr << list[idx..subidx]
#     end
#   end
#   largest_sum = 0
#   arr.each do |ele|
#     largest_sum = ele.sum if ele.sum > largest_sum
#   end
#   largest_sum
# end

# def largest_contiguous_subsum(list)
#   largest = 0
#   current_sum = 0
#   list.each do |el|
#     current_sum += el

#     if current_sum > largest
#       largest = current_sum
#     end 
#     if current_sum < 0
#       current_sum = 0
#     end
#   end
#   largest
# end

# def largest_contiguous_subsum(list)
#   max = -9999999
#   new_max = 0
#   list.each do |ele|
#     new_max += ele 
#     max = new_max if max < new_max
#     new_max = 0 if new_max < 0
#   end
#   max
# end

def largest_contiguous_subsum(list)
  prev_max = -9999999999999
  new_max = 0
  list.each do |ele|
    new_max += ele
    prev_max = new_max if prev_max <= new_max
    new_max = 0 if new_max < 0 # Reset
  end
  prev_max
end

p largest_contiguous_subsum([5, 3, -7]) # 8
p largest_contiguous_subsum([2, 3, -6, 7, -6, 7]) #= 8
p largest_contiguous_subsum([-2, -3, 4, -1, -2, 7, -1, -3]) # 10
p largest_contiguous_subsum([-2, -3, -4, -1, -2, -7, -1, -3])
 