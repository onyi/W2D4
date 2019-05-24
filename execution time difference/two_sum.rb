def bad_two_sum?(arr, target_sum)
  (0...arr.length - 1).each do |i|
    (i + 1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target_sum
    end
  end
  false
end

def okay_two_sum?(arr, target_sum)
  arr = arr.sort
  arr = arr[0...larger_idx(arr, target_sum)]
  (0...arr.length - 1).each do |i|
    (i + 1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target_sum
    end
  end
  false 
end



def larger_idx(arr, target_sum)
  (0...arr.length).each do |i|
    return i if target_sum < arr[i]
  end
  arr.length - 1
end


def two_sum?(arr, target_sum)
  hash = Hash.new()
  arr.each_with_index do |ele, idx|
    hash[ele] = idx
  end
  hash.each_key do |key|
    remainder = target_sum - key
    return true unless hash[remainder].nil?
  end
  false
end