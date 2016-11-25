class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  def initialize
    @store = []
  end

  def enqueue(el)
    @store.unshift(el)
  end

  def dequeue
    @store.pop
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store[0].nil?
  end
end

class StackQueue
  attr_accessor :input_stack, :output_stack
  def initialize
    @input_stack = MyStack.new
    @output_stack = MyStack.new
  end

  def enqueue(el)
    @input_stack.enqueue(el)
  end

  def dequeue
    until @input_stack.empty?
      @output_stack.enqueue(@input_stack.dequeue)
    end

    temp = @output_stack.dequeue

    until @output_stack.empty?
      @input_stack.enqueue(@output_stack.dequeue)
    end
    temp
  end

  def size
    @input_stack.size
  end

  def empty
    @input_stack.empty?
  end
end

class MinMaxStack < MyStack
  def initialize
    @maxes = MyStack.new
    @mins = MyStack.new
    super
  end

  def enqueue(el)
    if @maxes.empty? || el > @maxes.peek
      @maxes.enqueue(el)
    else
      @maxes.enqueue(@maxes.peek)
    end

    if @mins.empty? || el < @mins.peek
      @mins.enqueue(el)
    else
      @mins.enqueue(@mins.peek)
    end

    super
  end

  def dequeue
    @maxes.dequeue
    @mins.dequeue

    super
  end

  def max
    @maxes.peek
  end

  def min
    @mins.peek
  end
end

# p test1 = MinMaxStack.new
# p test1.enqueue(1)
# p test1.enqueue(2)
# p test1.enqueue(3)
# p test1.enqueue(4)
# p test1.max
# p test1.dequeue
# p test1.max
# p test1.min

class MinMaxStackQueue
  attr_accessor :input_stack, :output_stack
  def initialize
    @input_stack = MinMaxStack.new
    @output_stack = MinMaxStack.new
  end

  def enqueue(el)
    @input_stack.enqueue(el)
  end

  def dequeue
    until @input_stack.empty?
      @output_stack.enqueue(@input_stack.dequeue)
    end

    @output_stack.dequeue

    # until @output_stack.empty?
    #   @input_stack.enqueue(@output_stack.dequeue)
    # end
    # temp
  end

  def size
    @input_stack.size
  end

  def empty
    @input_stack.empty?
  end

  def min
    @input_stack.min
  end

  def max
    @input_stack.max
  end
end

# p test1 = MinMaxStackQueue.new
# p test1.enqueue(1)
# p test1.enqueue(2)
# p test1.enqueue(3)
# p test1.enqueue(4)
# p test1.max
# p test1.dequeue
# p test1.max
# p test1.min
