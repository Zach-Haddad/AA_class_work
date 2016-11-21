require 'byebug'

def range(first, last)
  return [] if last < first

  range(first, last - 1) + [last]
end

def recursive_sum(arr)
  return arr[0] if arr.length == 1
  arr.shift + recursive_sum(arr)
end

# def sum_rec(nums)
#   return 0 if nums.empty?
#   nums[0] + sum_rec(nums.drop(1))
# end

# use drop instead!

def it_sum(arr)
  arr.reduce(0, :+)
end

def expo1(base, exponent)
  exponent == 0 ? 1 : base * expo1(base, exponent-1)
end

def expo2(base, exponent)
  return 1 if exponent == 0
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
      result << (el.is_a?(Array) ? el.deep_dup : el)
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

# def fibs_rec(n)
#   if n <= 2
#     [0, 1].take(n)
#   else
#     fibs = fibs_rec(n - 1)
#     fibs << fibs[-2] + fibs[-1]
#   end
# end

#counts 0 as a term in fib seq!

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

def permutations(array)
  return [array] if array.length <= 1


  # Similar to the subsets problem, we observe that to get the permutations
  # of [1, 2, 3] we can look at the permutations of [1, 2] which are
  # [1, 2] and [2, 1] and add the last element to every possible index getting
  # [3, 1, 2], [1, 3, 2], [1, 2, 3], [3, 2, 1], [2, 3, 1]

  # pop off the last element
  first = array.shift
  # make the recursive call
  perms = permutations(array)
  # we will need an array to store all our different permutations
  total_permutations = []


  # Now we iterate over the result of our recusive call say [[1, 2], [2, 1]]
  # and for each permutation add first into every index. This new subarray
  # gets added to total_permutations.
  perms.each do |perm|
    (0..perm.length).each do |i|
      total_permutations << perm[0 ... i] + [first] + perm[i .. -1]
    end
  end
  total_permutations
end



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


#############################
# key
# I do exclude max, so this is like `min...max`.
# def range(min, max)
#   return [] if max <= min
#   range(min, max - 1) << max - 1
# end
#
# def sum_iter(nums)
#   sum = 0
#   nums.each { |num| sum += num }
#   sum
# end
#
# def sum_rec(nums)
#   return 0 if nums.empty?
#   nums[0] + sum_rec(nums.drop(1))
# end
#
# def exp1(base, power)
#   (power == 0) ? 1 : (base * exp1(base, power - 1))
# end
#
# def exp2(base, power)
#   return 1 if power == 0
#
#   half = exp2(base, power / 2)
#
#   if power.even?
#     half * half
#   else
#     # note that (power / 2) == ((power - 1) / 2) if power.odd?
#     base * half * half
#   end
# end
#
# class Array
#   def deep_dup
#     # Argh! Mario and Kriti beat me with a one line version?? Must
#     # have used `inject`...
#     new_array = []
#     self.each do |el|
#       new_array << (el.is_a?(Array) ? el.deep_dup : el)
#     end
#     new_array
#   end
#
#   # The renowned one-line inject version of deep_dup
#   # Beware inject!
#   def dd_inject
#     inject([]) { |dup, el| dup << (el.is_a?(Array) ? el.dd_inject : el) }
#   end
#
#   # Beware map! The ultimate one-liner.
#   def dd_map
#     map { |el| el.is_a?(Array) ? el.dd_map : el }
#   end
# end
#
# def fibs_iter(n)
#   return [] if n == 0
#   return [0] if n == 1
#
#   fibs = [0, 1]
#
#   while fibs.count < n
#     fibs << fibs[-2] + fibs[-1]
#   end
#
#   fibs
# end
#
# def fibs_rec(n)
#   if n <= 2
#     [0, 1].take(n)
#   else
#     fibs = fibs_rec(n - 1)
#     fibs << fibs[-2] + fibs[-1]
#   end
# end
#
# def permutations(array)
#   return [array] if array.length <= 1
#
#
#   # Similar to the subsets problem, we observe that to get the permutations
#   # of [1, 2, 3] we can look at the permutations of [1, 2] which are
#   # [1, 2] and [2, 1] and add the last element to every possible index getting
#   # [3, 1, 2], [1, 3, 2], [1, 2, 3], [3, 2, 1], [2, 3, 1]
#
#   # pop off the last element
#   first = array.shift
#   # make the recursive call
#   perms = permutations(array)
#   # we will need an array to store all our different permutations
#   total_permutations = []
#
#
#   # Now we iterate over the result of our recusive call say [[1, 2], [2, 1]]
#   # and for each permutation add first into every index. This new subarray
#   # gets added to total_permutations.
#   perms.each do |perm|
#     (0..perm.length).each do |i|
#       total_permutations << perm[0 ... i] + [first] + perm[i .. -1]
#     end
#   end
#   total_permutations
# end
#
# def bsearch(nums, target)
#   # nil if not found; can't find anything in an empty array
#   return nil if nums.empty?
#
#   probe_index = nums.length / 2
#   case target <=> nums[probe_index]
#   when -1
#     # search in left
#     bsearch(nums.take(probe_index), target)
#   when 0
#     probe_index # found it!
#   when 1
#     # search in the right; don't forget that the right subarray starts
#     # at `probe_index + 1`, so we need to offset by that amount.
#     sub_answer = bsearch(nums.drop(probe_index + 1), target)
#     (sub_answer.nil?) ? nil : (probe_index + 1) + sub_answer
#   end
#
#   # Note that the array size is always decreasing through each
#   # recursive call, so we'll either find the item, or eventually end
#   # up with an empty array.
# end
#
# class Array
#   def merge_sort
#     return self if count < 2
#
#     middle = count / 2
#
#     left, right = self.take(middle), self.drop(middle)
#     sorted_left, sorted_right = left.merge_sort, right.merge_sort
#
#     merge(sorted_left, sorted_right)
#   end
#
#   def merge(left, right)
#     merged_array = []
#     until left.empty? || right.empty?
#       merged_array <<
#         ((left.first < right.first) ? left.shift : right.shift)
#     end
#
#     merged_array + left + right
#   end
# end
#
# class Array
#   def subsets
#     return [[]] if empty?
#     subs = take(count - 1).subsets
#     subs.concat(subs.map { |sub| sub + [last] })
#   end
# end
#
# def make_change(target, coins = [25, 10, 5, 1])
#   # Don't need any coins to make 0 cents change
#   return [] if target == 0
#   # Can't make change if all the coins are too big. This is in case
#   # the coins are so weird that there isn't a 1 cent piece.
#   return nil if coins.none? { |coin| coin <= target }
#
#   # Optimization: make sure coins are always sorted descending in
#   # size. We'll see why later.
#   coins = coins.sort.reverse
#
#   best_change = nil
#   coins.each_with_index do |coin, index|
#     # can't use this coin, it's too big
#     next if coin > target
#
#     # use this coin
#     remainder = target - coin
#
#     # Find the best way to make change with the remainder (recursive
#     # call). Why `coins.drop(index)`? This is an optimization. Because
#     # we want to avoid double counting; imagine two ways to make
#     # change for 6 cents:
#     #   (1) first use a nickel, then a penny
#     #   (2) first use a penny, then a nickel
#     # To avoid double counting, we should require that we use *larger
#     # coins first*. This is what `coins.drop(index)` enforces; if we
#     # use a smaller coin, we can never go back to using larger coins
#     # later.
#     best_remainder = make_change(remainder, coins.drop(index))
#
#     # We may not be able to make the remaining amount of change (e.g.,
#     # if coins doesn't have a 1cent piece), in which case we shouldn't
#     # use this coin.
#     next if best_remainder.nil?
#
#     # Otherwise, the best way to make the change **using this coin**,
#     # is the best way to make the remainder, plus this one coin.
#     this_change = [coin] + best_remainder
#
#     # Is this better than anything we've seen so far?
#     if (best_change.nil? || (this_change.count < best_change.count))
#       best_change = this_change
#     end
#   end
#
#   best_change
# end
