require 'byebug'
class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
  end

  def my_select(&prc)
    res = []
    self.my_each { |el| res << el if prc.call(el) }
    res
  end

  def my_reject(&prc)
    res = []
    self.my_each { |el| res << el unless prc.call(el) }
    res
  end

  def my_any?(&prc)
    test = false
    self.my_each {|el| test = true if prc.call(el)}
    test
  end

  def my_all?(&prc)
    test = true
    self.my_each {|el| test = false if prc.call(el)}
    test
  end

  def my_flatten
    res = []
    self.each do |el|
      if el.is_a? Integer
        res << el
      elsif el.is_a? Array
        res = res + el.my_flatten
      end
    end

    res

  end

#   def my_flatten
#   flattened = []
#
#   self.my_each do |el|
#     if el.is_a?(Array)
#       flattened.concat(el.my_flatten)
#     else
#       flattened << el
#     end
#   end
#
#   flattened
# end

  def my_zip(*args)
    res = []
    self.length.times do |i|
      res << [self[i]]
      args.each do |subarray|
        res[i] << subarray[i]
      end
    end

    res
  end

  def my_rotate(n=1)
    if n > 0
      n.times do
        letter = self.shift
        self << letter
      end
    else
      n.abs.times do
        letter = self.pop
        self.unshift(letter)
      end
    end

    self
  end

  def my_join(sep = "")
    res = ""
    each_with_index do |letter, i|
      res += letter
      res += sep unless i == self.length - 1
    end
    res
  end

  def my_reverse
    res = []
    self.each do |let|
      res.unshift(let)
    end
    res
  end

end

def factors(num)
  (1..num).select { |number| num % number == 0 }
end


class Array

  def bubble_sort_prc!(&prc)
    sorted = false

    until sorted
      sorted = true
      self.each_with_index do |num1, i|
        j = i+1
        self[i+1..-1].each do |num2|
          if prc.call(num1, num2) == 1
            self[i], self[j] = self[j], self[i]
            j+=1
            sorted = false
          end
        end
      end
    end
    self
  end

  def bubble_sort!
    sorted = false

    until sorted
      sorted = true
      self.each_with_index do |num1, i|
        j = i+1
        self[i+1..-1].each do |num2|
          if num1 > num2
            self[i], self[j] = self[j], self[i]
            j+=1
            sorted = false
          end
        end
      end
    end
    self
  end

  def bubble_sort(&prc)
    new_array = self.dup
    new_array.bubble_sort_prc!
  end

end

def substrings(string)
  new_array = []
    (0...string.length).each do |idx|
      (idx...string.length).each do |idx2|
        new_array << string.slice(idx..idx2)
      end
    end
  new_array.uniq
end

def subwords(word, dictionary)
  array = substrings(word)
  array.select { |entry| dictionary.include?(entry) }
end
