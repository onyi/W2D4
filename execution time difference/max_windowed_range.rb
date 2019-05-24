# def windowed_max_range(array, window_size)
#   current_max_range = 0

#   (0..array.length - window_size).each do |i|
#     sub_arr = array[i...i + window_size]
#     min = sub_arr.min
#     max = sub_arr.max    
#     current_max_range = max - min if max - min > current_max_range
#     # puts current_max_range
#   end
#   current_max_range 
# end
# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5)

class MyQueue

  def initialize
    @vals = []
  end

  def enqueue(val)
    @vals.push(val)
  end

  def dequeue
    @vals.shift
  end

  def peek
    @vals.first
  end

  def empty?
    @vals.empty?
  end
end

class MyStack
  def initialize
    @vals = []
  end

  def push(val)
    @vals.push(val)
  end

  def pop
    @vals.pop
  end

  def peek
    @vals.last
  end

  def empty?
    @vals.empty?
  end

  def size
    @vals.length
  end
end

class StackQueue

  def initialize
    @front_stack = MyStack.new
    @back_stack = MyStack.new
  end

  def size
    @front_stack.size + @back_stack.size
  end

  def empty?
    @front_stack.empty? && @back_stack.empty?
  end

  def enqueue(val)
    @front_stack.push(@back_stack.pop) unless @back_stack.empty?
    @back_stack.push(val)
  end

  def dequeue
    val = @front_stack.pop
    @front_stack.push(@back_stack.pop) unless @back_stack.empty?
    val
  end
end

class MinMaxStack
  
end

class MinMaxStackQueue
end