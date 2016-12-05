class Link

  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new(:head)
    @tail = Link.new(:tail)
    @head.next, @head.prev = @tail, @tail
    @tail.next, @tail.prev = @head, @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each { |link| return link.val if link.key == key }
  end

  def find_link(key)
    each { |link| return link if link.key == key }
    nil
  end

  def include?(key)
    find_link(key).nil? ? false : true
  end

  def append(key, val)
    new_link = Link.new(key, val)
    last_link = @tail.prev
    last_link.next = new_link
    @tail.prev = new_link
    new_link.next = @tail
    new_link.prev = last_link
    new_link
  end

  def update(key, val)
    each do |link|
      link.val = val if link.key = key
    end
  end

  def remove(key)
    link = find_link(key)
    left_link = link.prev
    right_link = link.next

    left_link.next = right_link
    right_link.prev = left_link
  end

  def each
    link = @head.next
    until link == @tail
      yield link
      link = link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
