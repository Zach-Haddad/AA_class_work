require_relative 'game'
require_relative 'card'

class Board
attr_accessor :grid

  def initialize
    @grid = grid
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  # def []=(pos, mark)
  #   row, col = pos
  #   grid[row][col] = mark
  # end

  def make_grid
   @grid = Array.new(4){Array.new(4)}
  end

  def populate
    #assign vals to grid
    card_pool = ((1..8).to_a * 2).shuffle
    @grid.each_with_index do |row, row_idx|
      row.each_index do |col_idx|
        card = Card.new(card_pool.shift)
        @grid[row_idx][col_idx] = card
      end
    end
  end

  def render
    #main display method
    puts "   0  1  2  3   "
    @grid.each_with_index {|row , i| display_row(row,i) }
  end

  def display_row(row,i)
    chars = row.map {|card| card.display }.join("  ")
    p "#{i} #{chars}"
  end


  def won?
    @grid.flatten.all? { |el| el.face_up}
  end

  def board_flip(guessed_pos)
    self.grid[guessed_pos.first][guessed_pos.last].flip
  end
end
