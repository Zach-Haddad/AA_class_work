class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    error?(num)
    @store[num] = true
  end

  def remove(num)
    error?(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  def size
    @store.size
  end

  def error?(num)
    raise "out of range" if num >= size || num < 0
  end

  def show
    p @store
  end
end

a = MaxIntSet.new(3)

p a.insert(2)
p a.insert(1)
a.show
p a.remove(2)
a.show
p a.insert(5)
