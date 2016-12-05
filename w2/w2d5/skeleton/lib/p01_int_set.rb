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

  def show
    p @store
  end

  def size
    @store.size
  end

  private

  def error?(num)
    raise "Out of bounds" if num >= size || num < 0
  end

  # def is_valid?(num)
  # end
  #
  # def validate!(num)
  # end
end


class IntSet
  def initialize(num_buckets = 20)
    @num_buckets = num_buckets
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[(num % @num_buckets)]
  end

  # def num_buckets
  #   @store.length
  # end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count + 1 > @store.size
    self[num] << num
    @count += 1
  end

  def remove(num)
    self[num].shift
  end

  def include?(num)
    self[num].include?(num)
  end

  def show
    p @set
  end

  private

  def [](num)
    @store[(num % @store.size)]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old = @store.dup
    @store = Array.new(@count * 2) {[]}
    # @size = @store.length
    reassign(old)
  end

  def reassign(old)
    @count = 0
    old.each do |bucket|
      next if bucket.empty?
      insert(bucket[0])
    end
  end

end
