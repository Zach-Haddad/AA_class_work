require_relative 'stacks'
require 'time'

def windowed_max_range(arr, window)
  current_max_range = nil

  arr[0..arr.length - window].each_with_index do |el, idx|

    max = arr[idx...idx + window].max
    min = arr[idx...idx + window].min
    current_max_range ||= max - min
    current_max_range = max - min if max - min > current_max_range
  end
  p current_max_range
end
arr1 = Array.new(200) { rand(30) }

start_time = Time.now
windowed_max_range(arr1, 2) # 4, 8
# windowed_max_range(arr1, 3) # 0, 2, 5
# windowed_max_range(arr1, 4)# 2, 5, 4, 8
# windowed_max_range(arr1, 5) # 3, 2, 5, 4, 8
p Time.now - start_time

def windowed_max_range_stack(arr, window)

  queue = MinMaxStackQueue.new
  window.times {queue.enqueue(arr.shift)} #initial window
  current_max_range = queue.max - queue.min

  until arr.empty?
    queue.dequeue
    queue.enqueue(arr.shift)
    max, min = queue.max, queue.min
    current_max_range = max - min if max - min > current_max_range
  end

  current_max_range
end


start_time = Time.now
# p windowed_max_range_stack([1,2,3,4,5,6,7,8,9], 2) # 4, 8
p windowed_max_range_stack(arr1, 3)# 0, 2, 5
# p windowed_max_range_stack(arr1.dup, 3)# 2, 5, 4, 8
# p windowed_max_range_stack(arr1, 3)
p Time.now - start_time
