require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  # def my_inject(accumulator = nil, &prc)
  #   i = 0
  #   if accumulator.nil?
  #     accumulator = self.first
  #     i += 1
  #   end
  #
  #   while i < self.length
  #     accumulator = prc.call(accumulator, self[i])
  #     i += 1
  #   end
  #
  #   accumulator
  # end

  def my_inject(accumulator = nil)
    accumulator ||= self.shift

    self.each {|x| accumulator = yield(accumulator, x)} #watch space between yield and (!
    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  return false if num < 2
  (2...num).none? {|x| num % x == 0}
end

def primes(num)
  arr = []
  i = 0
  until arr.length == num
    arr << i if is_prime?(i)
    i += 1
  end
  arr
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  facs = factorials_rec(num-1) #previous
  facs << facs.last * (num-1) #next
  facs
end

p factorials_rec(3)

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new{[]}
    self.each_with_index do |el, idx|
      l = self[0...idx]; r = self[idx+1..-1]
      hash[el] += [idx] if l.include?(el) || r.include?(el)
    end
    hash
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    subs = []
    (0...self.length-1).each do |start|
      (start+2...self.length).each do |endd|
        sub = self[start..endd]
        subs << sub if sub == sub.reverse
      end
    end

    subs
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    prc ||= Proc.new {|x,y| x <=> y} #set proc conditionally equal to spec-described proc

    return self if self.length <= 1
    midpoint = self.length/2
    l = self.take(midpoint).merge_sort(&prc)
    r = self.drop(midpoint).merge_sort(&prc)
    Array.merge(l, r, &prc)
  end

  private
  def self.merge(l, r, &prc)
    res =[]

    until l.empty? || r.empty?
      case prc.call(l.first, r.first)
      when -1
        res.push(l.shift)
      when 0 #doesn't matter either way
        res.push(l.shift)
      when 1
        res.push(r.shift)
      end
    end

    res.concat(l); res.concat(r) #add remaining, if any

    res
  end
end
