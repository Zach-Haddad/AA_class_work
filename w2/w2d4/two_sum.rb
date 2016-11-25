def bad_two_sum(arr, target)
  arr.each_with_index do |el1, i1|
    (i1+1...arr.length).each do |i2|
      el2 = arr[i2]
      return true if (el1 + el2 == target)
    end
  end

  false
end

p bad_two_sum([1,2,3,4], 6)
p bad_two_sum([1,2,-2,4], 200)

# time: O(n^2)
# space: O(n) ?

def okay_two_sum(arr, target)
  sorted_arr = arr.sort
  while sorted_arr.any?
    partner = target - sorted_arr.pop
    return true if b_search(sorted_arr, partner)
  end

  false
end

def b_search(arr, target)
  return false if arr.empty?
  mid = arr.length/2
  l = arr.take(mid)
  r = arr.drop(mid)

  case arr[mid] <=> target
  when -1
    b_search(l, target)
  when 0
    return true
  when 1
    b_search(r, target)
  end
end

p okay_two_sum([1,2,3,4], 6)
p okay_two_sum([1,2,-2,4], 200)

# time: O(n*log(n))

def pair_sum?(arr, target)
  hash = Hash.new(0)
  arr.each {|el| hash[el] = (target - el)}
  hash.any? {|k,_| hash.values.include?(k)}
end

p pair_sum?([1,2,3,4], 6)
p pair_sum?([1,2,-2,4], 200)
