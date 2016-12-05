require_relative 'p02_hashing'
require 'byebug'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    # byebug
    key = key.hash
    resize! if @count + 1 > @store.size
    self[key] << key
    @count += 1
  end

  def include?(key)
    key = key.hash
    self[key].include?(key)
  end

  def remove(key)
    key = key.hash
    self[key].shift
  end

  private

  def [](num)
    @store[(num % @store.size)]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old = @store.dup
    @store = Array.new(@count * 2) {[]}
    reassign(old)
  end

  def reassign(old)
    @count = 0
    old.each do |bucket|
      next if bucket.empty?
      bucket.each do |el|
        insert(el)
      end
    end
  end
end
