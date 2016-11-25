class TowerGame

  attr_reader :towers

  def initialize
    @towers = [[1, 2, 3], [], []]
  end

  def move(from_tower, to_tower)
    towers[to_tower] << towers[from_tower].shift if valid_move?(from_tower, to_tower)
  end

  def valid_move?(from_tower, to_tower)
    return true if towers[to_tower].empty?
    towers[to_tower].first > towers[from_tower].first
  end

  def won?
    towers[0].empty? && (towers[1].empty? || towers[2].empty?)
  end
end
