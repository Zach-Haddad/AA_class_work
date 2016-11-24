fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish',
        'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# SLUGGISH OCTOPUS
# Find the longest fish in O(n^2) time.
# Do this by comparing all fish lengths to all other fish lengths

def quadratic_fish(arr)
  longest = nil
    arr[0...-1].each_with_index do |fish1, idx|
      (idx+1...arr.length).each do |idx2|
        fish2 = arr[idx2]
        longest = fish1.length > fish2.length ? fish1 : fish2
      end
    end

    longest
end

#Dominant Octopus
# Find the longest fish in O(n log n) time.
# Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Demo.
# Remember that Big O is classified by the dominant term.

# use merge sort

class Array
  def merge_sort
    return self if count < 2
    mid = count / 2

    l = (self.take(mid)).merge_sort
    r = (self.drop(mid)).merge_sort

    merge(l, r)
  end

  def merge(l, r)
    merged_array = []
    until l.empty? || r.empty?
      merged_array << ((l.first.length < r.first.length) ? l.shift : r.shift)
    end

    merged_array + l + r
  end
end

p fish.merge_sort.last

# Clever Octopus
# Find the longest fish in O(n) time.
# The octopus can hold on to the longest fish that you have found so far
# while stepping through the array only once.

def linear_fish(arr)
  longest = nil
  arr.each_with_index do |fish, idx|
    longest = fish if longest.nil? || fish.length > longest.length
  end

  longest
end

p linear_fish(fish)


# Dancing Octopus

tiles_array = ["up", "right-up", "right", "right-down", "down",
              "left-down", "left",  "left-up" ]
# Slow Dance -- Array
# Given a tile direction, iterate through a tiles array to return
# the tentacle number (tile index) the octopus must move.
# This should take O(n) time.

def slow_dance(dir, arr)
  tiles_array.find_index(dir)
end

# Constant Dance!

# Now that the octopus is warmed up, let's help her dance faster.
# Use a different data structure and write a new function so that
# you can access the tentacle number in O(1) time.

# use a hash!

tiles_hash = {up: 1, right_up:2, right: 3, right_down: 4, down: 5
              left_down: 6, left: 7, left_up: 8}

def constant_dance(dir, hash)
  hash[dir]
end
