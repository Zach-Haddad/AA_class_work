def my_min_poly(arr)
  min = nil

  arr[0..-1].each_with_index do |el1, i1|
    (i1...arr.length).each do |i2|
      el2 = arr[i2]
      min = el1 if el1 < el2
    end
  end

  min
end

arr = [5,4,2,1,3]


def my_min_lin(arr)
  min = nil

  arr.each do |el|
    min = el if min.nil? || el < min
  end

  min
end

def sub_sum1(arr)
  subsets = []

  arr.each_index do |i1|
    (i1..arr.length).each do |i2|
      subsets << arr[i1..i2]
    end
  end

  subsets.max_by {|subset| subset.reduce(:+)}
end

p sub_sum1([2, 3, -6, 7, -6, 7])

def sub_sum2(arr)
  largest_sum = arr[0]
  current_sum = arr[0]

  arr[1..-1].each do |el|
    #current_sum = 0 if current_sum < 0
    current_sum += el
    if current_sum >= largest_sum
      largest_sum = current_sum
    else
      current_sum = 0
    end
  end

  largest_sum
end

p sub_sum2([2, 3, -6, 7, -6, 7])
