# Stack - write a stack; LIFO

class Stack
   def initialize
     @stack = []
   end

   def add(el)
     @stack << el
   end

   def remove
     @stack.pop
   end

   def show
     @stack.dup
   end
 end

# Queue - FIFO
class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end

# Map -- using array! ex :  my_map = [[k1, v1], [k2, v2], [k3, v2], ...].
# instance methods : ssign(key, value), lookup(key), remove(key), show
# assign method can be used to either create a new key-value pair or update
# the value for a pre-existing key. It's up to you to check whether a key currently exists!

class Map
  def initialize
    @map = []
  end

  def assign(key,value) #assign or update!
    match_i = @map.find_index{|k,v| key == k}
    match_i.nil? ? @map << [key,value] : @map[match_i, 1] = value
  end

  def lookup(key)
    @map[@map.find_index{|k,v| key == k}][1]
  end

  def remove(key)
    @map.delete_at(@map.find_index{|k,v| key == k})
  end

  def show
    @map.dup
  end

end
