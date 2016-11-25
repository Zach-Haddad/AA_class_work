class Array
  def my_uniq
    new = []
    each { |el| new << el unless new.include?(el) }
    new
  end

  def two_sum
    arr = []
    each_index do |i|
      ((i + 1)...self.length).each do |i2|
        arr << [i, i2] if self[i] + self[i2] == 0
      end
    end
    arr
  end

  def my_transpose
    arr = []
    each do |row|
      row.each_index do |i|
        arr[i].is_a?(Array) ? arr[i] << row[i] : arr[i] = [row[i]]
      end
    end
    arr
  end

  def stock_picker
    current_buy = nil
    current_sell = nil
    max_diff = 0

    each_with_index do |price1, day1|
      current_buy = day1 if current_buy.nil?
      (day1...length).each do |day2|
        current_diff = self[day2] - price1
        if current_diff > max_diff
          max_diff = current_diff
          current_buy = day1
          current_sell = day2
        end
      end
    end
    [current_buy, current_sell]
  end

end
