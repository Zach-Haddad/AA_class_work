require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require 'byebug'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      link = @map.get(key)
      update_link!(link).val
    else
      eject! if count >= @max
      calc!(key)
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # debugger
    new_link = @store.append(key, @prc.call(key))
    @map.set(key, new_link)
    new_link.val
  end

  def update_link!(link)
        # debugger
    p self.to_s
    @store.remove(link.key)
    new_link = @store.append(link.key, link.val)
    @map.set(new_link.key, new_link)
    new_link
  end

  def eject!
    target = @store.first.key
    @store.remove(target)
    @map.delete(target)
  end
end
