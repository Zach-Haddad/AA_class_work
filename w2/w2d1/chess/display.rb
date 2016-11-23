require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  attr_reader :board, :cursor

  def initialize(board, cursor)
    @board = board
    @cursor = cursor
    # @cursor = Cursor.new([0, 0], board)
  end

  def render
    display = []
    grid = board.grid
    cursor_row, cursor_col = cursor.cursor_pos
    grid.each_index do |row_idx|
      display_row = ""
      grid[row_idx].each_index do |col_idx|
        piece = board[[row_idx, col_idx]]
        display_cell = " #{piece} "
        if (row_idx.even? && col_idx.odd?) || (row_idx.odd? && col_idx.even?)
          display_cell = display_cell.colorize(background: :light_black)
        end
        if row_idx == cursor_row && col_idx == cursor_col
          display_cell = display_cell.colorize(background: :red)
        end
        display_row << display_cell
      end
      display << display_row
    end
    puts display
  end
end
