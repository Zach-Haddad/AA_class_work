class LRUCache
  def initialize(length)
    @cache = []
    @length = length
  end

  def count
    @cache.count
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
      @cache << el
    elsif count >= @length
      @cache.shift
      @cache << el
    else
      @cache << el
    end
  end

  def show
    p @cache
  end
end

sample = LRUCache.new(3)
p sample.add(2)
p sample.add(3)
p sample.add(1)
p sample.add(4)
p sample.add(5)
p sample.add(3)
p sample.add(4)
