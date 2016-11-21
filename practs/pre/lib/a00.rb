# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  str.chars.map {|letter| translate(letter, shift)}.join
end

def translate(letter, shift)
  return " " if letter == " "
  alpha = ("a".."z").to_a
  new_i = (alpha.find_index(letter) + shift) % 26
  alpha[new_i]
end


# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
  digs = []

  while num > 0
    digs << (num % 10)
    num /= 10
  end

  sum = digs.reduce(:+)
  sum > 10 ? digital_root(sum) : sum
end


# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  return tr.chars.sort.join if alphabet.nil?

  res = ""
  alphabet.each do |order_letter|
    num = str.count(order_letter)
    num.times {res += order_letter}
  end

  res
end


class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    pairs = []
    each_with_index do |num, idx|
      (idx + 1...length).each do |idx2|
        num2 = self[idx2]
        pairs << [idx, idx2] if (num + num2) == 0
      end
    end

    pairs
  end
end


class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    result = []

    (0...length).each do |idx|
      (1...(length - idx)).each do |length|
        subword = self.slice(idx, length)
        result << subword if dictionary.include?(subword)
      end
    end

    result.uniq
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  (1..num).select {|n| num % n == 0}
end



# # Back in the good old days, you used to be able to write a darn near
# # uncrackable code by simply taking each letter of a message and incrementing it
# # by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# # to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# # will take a message and an increment amount and outputs the encoded message.
# # Assume lowercase and no punctuation. Preserve spaces.
# #
# # To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# # the position of a letter in the array, you may use `Array#find_index`.
#
# def caesar_cipher(str, shift)
#
#   result = []
#   words = str.split
#   words.map! do |word|
#     word.chars.map {|letter| translate(letter,shift)}.join
#   end
#
#   words.join(" ")
# end
#
# def translate(letter,shift)
#   alpha = ("a".."z").to_a
#   letter_index = alpha.find_index(letter)
#   new_index = letter_index + shift
#   alpha[new_index % 26]
# end
#
# # Write a method, `digital_root(num)`. It should Sum the digits of a positive
# # integer. If it is greater than 10, sum the digits of the resulting number.
# # Keep repeating until there is only one digit in the result, called the
# # "digital root". **Do not use string conversion within your method.**
# #
# # You may wish to use a helper function, `digital_root_step(num)` which performs
# # one step of the process.
#
# def digital_root(num)
#   num > 10 ? num%9 : num
# end
#
#
# # Jumble sort takes a string and an alphabet. It returns a copy of the string
# # with the letters re-ordered according to their positions in the alphabet. If
# # no alphabet is passed in, it defaults to normal alphabetical order (a-z).
#
# # Example:
# # jumble_sort("hello") => "ehllo"
# # jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'
#
# def jumble_sort(str, alphabet = nil)
#   return str.chars.sort.join if alphabet.nil?
#   res = ""
#
#   alphabet.each do |order_letter|
#     letter_count(str, order_letter).times {res += order_letter}
#   end
#
#   res
# end
#
# def letter_count(str, letter)
#   str.chars.count {|x| x == letter}
# end
#
# class Array
#   # Write a method, `Array#two_sum`, that finds all pairs of positions where the
#   # elements at those positions sum to zero.
#
#   # NB: ordering matters. I want each of the pairs to be sorted smaller index
#   # before bigger index. I want the array of pairs to be sorted
#   # "dictionary-wise":
#   #   [0, 2] before [1, 2] (smaller first elements come first)
#   #   [0, 1] before [0, 2] (then smaller second elements come first)
#
#   def two_sum
#     result = []
#     self[0..-1].each_with_index do |num1, idx1|
#       (idx1+1 ... self.length).each do |idx2|
#         num2 = self[idx2]
#         result << [idx1, idx2] if num1 + num2 == 0
#       end
#     end
#
#     result
#   end
# end
#
#
# class String
#   # Returns an array of all the subwords of the string that appear in the
#   # dictionary argument. The method does NOT return any duplicates.
#
  # def real_words_in_string(dictionary)
  #   result = []
  #
  #   (0...self.length).each do |idx|
  #     (1..(self.length - idx - 1)).each do |length|
  #       subword = self.slice(idx, length)
  #       result << subword if dictionary.include?(subword)
  #     end
  #   end
  #
  #   result.uniq
  # end
# end
#
# # Write a method that returns the factors of a number in ascending order.
#
# def factors(num)
#   factors = []
#   (1..num).each {|x| factors << x if num % x == 0}
#   factors
# end
