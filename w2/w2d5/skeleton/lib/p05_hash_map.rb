require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    resize! if @count + 1 > @store.size
    target_list = bucket(key)
    if target_list.include?(key)
      target_list.update(key, val)
    else
      target_list.append(key, val)
      @count += 1
    end
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    if include?(key)
      bucket(key).remove(key)
      @count -= 1
    end
  end

  def each
    @store.each do |bucket|
      bucket.each do |link|
        yield link.key, link.val
      end
    end

  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    old = self.dup
    @store = Array.new(@count * 3) {LinkedList.new}
    reassign(old)
  end

  def reassign(old)
    @count = 0
    old.each do |k,v|
      set(k,v)
    end
  end

  def bucket(key)
    @store[key.hash % @store.size]
  end
end
