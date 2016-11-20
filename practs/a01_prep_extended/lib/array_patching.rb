require 'byebug'
class Array
  def my_each(&prc)
    self.each {|x| prc.call(x)} #or yield(x)
  end

  def my_each_with_index(&prc)
    self.each_index {|i| yield(self[i],i)}
  end

  def my_select(&prc)
    res = []
    self.my_each {|el| res << el if prc.call(el)}
    res
  end

  def my_reject(&prc)
    res = []
    self.my_each {|el| res << el unless prc.call(el)}
    res.empty? ? self : res
  end

  def my_any?(&prc)
    self.my_each{|el| return true if prc.call(el)}
    false
  end

  def my_all?(&prc)
    self.my_each{|el| return false unless prc.call(el)}
    true
  end

  # Takes a multi-dimentional array and returns a single array of all the elements
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
  def my_flatten
    res = []
    self.each do |el|
      unless el.is_a?(Array)
        res << el
      else
        res += el.my_flatten
      end
    end

    res

  end

  # Write a version of flatten that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,[5]]
  def my_controlled_flatten(n)
    res = []
    self.each do |el|
      if !el.is_a?(Array)
        res << el
      elsif el.is_a?(Array) && n == 1
        res += el
      else
        n.times {res += el.my_controlled_flatten(n-1)}
      end
    end

    res
  end

  def my_zip(*arrs)
    res = []
    self.length.times do |i|
      res << [self[i]]
      arrs.each do |subarr|
        res[i] << subarr[i]
      end
    end

    res
  end

  def my_rotate(num=1)
    split_idx = num % self.length
    self.drop(split_idx) + self.take(split_idx)
  end

  def my_join(str = "")
    res = ""
    self.each_with_index {|el, i| i < self.length - 1 ? res += (el.to_s + str) : res += el.to_s }
    res
  end

  def my_reverse
    res = []
    self.each {|el| res.unshift(el)}
    res
  end

  #Write a monkey patch of quick sort that accepts a block
  def my_quick_sort(&prc)
    prc ||= proc {|a,b| a <=> b}
    return self if length < 2

    pivot = first
    less = self[1..-1].select{|el| prc.call(el, pivot) == -1}
    more = self[1..-1].select{|el| prc.call(el, pivot) >= 0}

    less.my_quick_sort(&prc) + [pivot] + more.my_quick_sort(&prc)
  end

  # Write a monkey patch of binary search that accepts a comparison block:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(6) {|el, targ| el+1 <=> targ} => 4
  def my_bsearch(target, &prc)
    return nil if size == 0
    prc ||= proc {|a,b| a <=> b}
    #use dup and take/drop when you don't want to modify original array!!

    midpoint = length/2
    case prc.call(target, self[midpoint])
    when -1
      self.dup.take(midpoint).my_bsearch(target, &prc)
    when 0
      return midpoint
    when 1
      res = self.dup.drop(midpoint + 1).my_bsearch(target, &prc)
      res.nil? ? nil : midpoint + 1 + res
      #need mid + 1 + res; 1 accounts for index offset, res is new midpt, mid is old midpt
    end
  end

end
