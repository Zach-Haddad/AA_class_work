require "byebug"

class RecursionMachine

  # Implement a method that finds the sum of the first n
  # fibonacci numbers recursively. Assume n > 0
  def fibs_sum(n)
    return 1 if n == 1
    return 0 if n == 0

    fibs_sum(n-1) + fibs_sum(n-2) + 1
  end

  #returns all subsets of an array
  def subsets(array)
    return [[]] if array.empty?

    subarray = subsets(array[0..-2])
    subarray += (subarray.map{|el| el += [array.last]})
  end


  # return the sum of the first n even numbers recursively. Assume n > 0
  def first_even_numbers_sum(n)
    return 2 if n == 1

    2*n + first_even_numbers_sum(n-1)
  end

  # return b^n recursively. Your solution should accept negative values
  # for n
  def exponent(b, n)
    return 1 if n == 0

    n < 0 ? (1/b.to_f) * exponent(b, n + 1) :  b * exponent(b, n -1)
  end

  # make better change problem from class
  def make_better_change(value, coins)
    coins_to_check = coins.select{|coin| coin <= value}
    return nil if coins_to_check.empty?

    solutions = []

    coins_to_check.sort.reverse.each do |coin|
      remainder = value - coin

      if remainder > 0
        remainder_solution = make_better_change(remainder, coins_to_check)
        solutions << [coin] + remainder_solution unless remainder_solution.nil?
      else
        solutions << [coin]
      end
    end

    solutions.sort_by!{|arr| arr.size}.first
  end

  #deep dup question from class
  def deep_dup(arr)
    arr.map {|sub| sub.is_a?(Array) ? deep_dup(sub) : sub}
  end

  # Write a recursive method that takes in a string to search and a key string.
  # Return true if the string contains all of the characters in the key
  # in the same order that they appear in the key.
  #
  # string_include_key?("cadbpc", "abc") => true
  # string_include_key("cba", "abc") => false
  def string_include_key?(string, key)
    return true if key == ""
    idx = string.index(key[0])
    return false if idx.nil?
    string_include_key?(string[idx+1..-1], key[1..-1])

  end

  # Write a recursive function that returns the prime factorization of
  # a given number. Assume num > 1
  #
  # prime_factorization(12) => [2,2,3]
  def prime_factorization(num)
    return [num] if is_prime?(num)
    div_prime = (2...num).find {|el| num % el == 0}
    num /= div_prime
    prime_factorization(num) << div_prime
  end

  def is_prime?(num)
    return false if num < 2
    (2...num).none?{|el| num % el == 0}
  end

  # Write a method, `digital_root(num)`. It should Sum the digits of a positive
  # integer. If it is greater than 10, sum the digits of the resulting number.
  # Keep repeating until there is only one digit in the result, called the
  # "digital root". **Do not use string conversion within your method.**
  #
  # You may wish to use a helper function, `digital_root_step(num)` which performs
  # one step of the process.

  def digital_root(num)
    digits = []

    while num > 0
      digits << num % 10 #work around, iterate through num
      num /= 10
    end

    sum = digits.reduce(:+)
    sum > 10 ? digital_root(sum) : sum
  end

  # Write a recursive method that takes in a base 10 number n and
  # converts it to a base b number. Return the new number as a string
  #
  # E.g. base_converter(5, 2) == "101"
  # base_converter(31, 16) == "1f"

  def base_converter(num, b)
    return "" if num == 0

    digits = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
    base_converter(num/b, b) + digits[num % b]
  end

  # CHALLENGE: Eight queens puzzle precursor
  #
  # Write a recursive method that generates all 8! possible unique ways to
  # place eight queens on a chess board such that no two queens are in
  # the same board row or column (the same diagonal is OK).
  #
  # Each of the 8! elements in the return array should be an array of positions:
  # E.g. [[0,0], [1,1], [2,2], [3,3], [4,4], [5,5], [6,6], [7,7]]
  #
  # My solution used 3 method parameters: current_row, taken_columns, and
  # positions so far
  def eight_queens_possibilities(current_row, taken_columns, positions)

  end

end
