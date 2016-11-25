require 'rspec'
require 'TDD'

describe Array do
  describe '#my_uniq' do
    subject(:dup_array) {[1,1,2,3,3]}

    it "removes duplicates from array" do
      expect(dup_array.my_uniq).to eq([1,2,3])
    end

    it "doesn't modify the original array" do
      expect(dup_array.my_uniq).to_not eq(dup_array)
    end
  end

  describe '#two_sum' do
    subject(:sum_array) { [-1, 0, 2, -2, 1] }

    it "returns indices of elements summing to 0" do
      expect(sum_array.two_sum).to eq([[0,4], [2,3]])
    end

    it "doesn't sum the same elements" do
      expect(sum_array.two_sum).to_not include([1,1])
    end

  end

  describe '#my_transpose' do
    subject(:twod_arr) { [[1,1,1],[2,2,2],[3,3,3]] }
    let(:rekt_arr) { [[1,1],[2,2],[3,3]] }

    it "transposes the array" do
      expect(twod_arr.my_transpose).to eq([[1,2,3],[1,2,3],[1,2,3]])
    end

    it "doesn't modify the original array" do
      expect(twod_arr.my_transpose).to_not equal(twod_arr)
    end

    it "works with rectangular matrices" do
      expect(rekt_arr.my_transpose).to eq([[1,2,3],[1,2,3]])
    end
  end

  describe '#stock_picker' do
    subject(:stocks) {[9, 3, 2, 8, 7, 1]}

    it "selects the most profitable pair of days" do
      expect(stocks.stock_picker).to eq([2,3])
    end

    it "doesn't try to sell before it buys" do
      expect(stocks.stock_picker).to_not eq([5, 0])
    end


  end

end
