def first_anagram?(str1, str2)
  str1.chars.permutation.to_a.map(&:join).include?(str2)
end



def second_anagram?(str1, str2)
  double1, double2 = str1.chars, str2.chars
  str1.chars.each_with_index do |el1, i1|
    double2.each_with_index do |el2, i2|
    double2.delete_at(i2) if el1 == el2
    end
  end

  str2.chars.each_with_index do |el1, i1|
    double1.each_with_index do |el2, i2|
    double1.delete_at(i2) if el1 == el2
    end
  end

  p double1.empty? && double2.empty?
end

def third_anagram?(str1, str2)
  p str1.chars.sort == str2.chars.sort
end

def fourth_anagrams?(str1, str2)
  out = Hash.new {|h,k| h[k] = 0}
  str1.chars.each do |el|
    out[el] += 1
  end
  str2.chars.each do |el|
    out[el] -= 1
  end
  p out.values.all? { |v| v == 0 }
end

fourth_anagrams?("gizmo", "sally")
fourth_anagrams?("elvis", "lives")
