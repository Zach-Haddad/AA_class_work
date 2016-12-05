class IntSet

  def initialize(size)
    @size = size
    @set = Array.new(size){[]}
  end

  def [](num)
    @set[(num % @size)]
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

  def show
    p @set
  end
end

###Resizable

class IntSet2

  def initialize
    @set = Array.new(1) {[]}
    @size = @set.length
  end

  def [](num)
    @set[(num % @size)]
  end

  def insert(num)
    resize until self[num].empty?
    self[num] << num
  end

  def remove(num)
    self[num].shift
  end

  def include?(num)
    self[num].include?(num)
  end

  def resize
    old = @set.dup
    @set = Array.new(@size * 2) {[]}
    @size = @set.length
    reassign(old)
  end

  def reassign(old)
    old.each do |bucket|
      next if bucket.empty?
      insert(bucket[0])
    end
  end

  def show
    p @set
  end

end

a = IntSet2.new
a.insert(6)
a.show
a.insert(2)
a.show
a.insert(1000)
a.show
a.remove(6)
a.show
