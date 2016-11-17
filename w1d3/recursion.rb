require 'byebug'

def range(first, last)
  return [] if last < first

  range(first, last - 1) + [last]
end

def recursive_sum(arr)
  return arr[0] if arr.length == 1
  arr.shift + recursive_sum(arr)
end

def it_sum(arr)
  arr.reduce(0, :+)
end

def expo1(base, exponent)
  return 1 if exponent == 0
  base * expo1(base, exponent-1)
end

def expo2(base, exponent)
  return 1 if exponent.zero?
  return base if exponent == 1

  if exponent.even?
    expo2(base, exponent / 2) * expo2(base, exponent / 2)
  else
    base * (expo2(base, (exponent - 1) / 2) * expo2(base, (exponent - 1) / 2))
  end
end

class Array
  def deep_dup
    result = []

    self.each do |el|
      if el.is_a?(Array)
        result += [el.deep_dup]
      else
        result << el
      end
    end

    result
  end
end

def fib_it(n)
  base = [1,1]
  return nil if n == 0

  (n-2).times {base << (base[-1] + base[-2])}

  base[0..(n-1)]

end

# def fib_rec(n)
#   return 1 if n <= 2
#   fib_rec(n-1) + fib_rec(n-2)
# end
#
# def fib_rec_seq(n)
#   res = []
#   (1..n). each {|idx| res << fib_rec(idx)}
#   res
# end

def fib_rec(n, base=[1,1])
  return [1] if n == 1
  n > 2 ? fib_rec(n-1, base + [base[-1] + base[-2]]) : base
end

# def permutations(array)
#   return array.first if array.length == 1
#   result = []
#
#   array.each do |el|
#     perms = [permutations(array.select { |j| j != el })]
#     result << [el] perms
#   end
#
#   result
# end

# def bsearch(arr, target, low=0, high=nil)
#   if high == nil
#     high = arr.count - 1
#   end
#
#  midpoint = (low + high) / 2
#
#   case target <=> arr[midpoint]
#   when 0
#     return midpoint
#   when -1
#     bsearch(arr, target, low, midpoint - 1) #left side
#   when 1
#     bsearch(arr, target, midpoint + 1, high) #right side
#   end
#
# end

def merge_sort(arr)
  return arr if arr.length <= 1 #base case
  midpoint = arr.length / 2
  left = merge_sort(arr.take(midpoint))
  right = merge_sort(arr.drop(midpoint))
  return merge(left,right)
end

def merge(first_half, second_half)
  result = []

  while first_half.any? && second_half.any?
    if first_half.first > second_half.first
      result.push(second_half.shift)
    else
      result.push(first_half.shift)
    end
  end

  while first_half.any?
    result.push(first_half.shift)
  end

  while second_half.any?
    result.push(second_half.shift)
  end

  result
end

# def subsets(arr, res= [[]])
#   return [] if arr.empty?
#   num = arr.shift
#   step = res * 2
#   step.map!.with_index {|suba, idx| idx < step.length ? suba << num : suba}
#   subsets(step)
# end


def greedy_make_change(amount, coin_array=[25,10,5,1])

  return [] if amount == 0
  coin = coin_array.find {|coin| coin <= amount}
  amount -= coin
  [coin] + greedy_make_change(amount)
end

# def make_better_change(amount, coin_array=[25,10,5,1])
#   return [] if amount == 0
#   previous_change = []
#   current_change = []
#
#   coins.each do |coin|
#     amount -= coin
#     previous_change = [coin] + greedy_make_change(amount)
#   end
#
#   best_change
# end
