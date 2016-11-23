require_relative 'piece'

class Board
  attr_reader :grid

  def initialize(grid = nil)
    if grid.nil?
      make_starting_grid
    else
      @grid = grid
    end
  end

  def make_starting_grid
    @grid = Array.new(8) { Array.new(8) }

    create_named_row(0, :white)
    create_pawn_row(1, :white)
    create_pawn_row(6, :black)
    create_named_row(7, :black)

    nil_rows = (2..5).to_a
    nil_rows.each do |row_i|
      8.times { |col_i| self[[row_i, col_i]] = NullPiece.instance }
    end
  end

  def create_pawn_row(row_idx, color)
    grid[row_idx].each_index do |col_idx|
      pos = [row_idx, col_idx]
      self[pos] = Pawn.new(pos, self, color)
    end
  end

  def create_named_row(row_idx, color)
    grid[row_idx].each_index do |col_idx|
      pos = [row_idx, col_idx]
      case col_idx
      when 0, 7
        self[pos] = Rook.new(pos, self, color)
      when 1, 6
        self[pos] = Knight.new(pos, self, color)
      when 2, 5
        self[pos] = Bishop.new(pos, self, color)
      when 3
        self[pos] = King.new(pos, self, color)
      when 4
        self[pos] = Queen.new(pos, self, color)
      end
    end
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    raise "There is no piece at that position!" if piece == NullPiece.instance
    raise "Invalid move for given piece!" unless piece.valid_moves.include?(end_pos)
    self[start_pos], self[end_pos] = NullPiece.instance, piece
    piece.pos = end_pos
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end

  def in_bounds?(pos)
    pos.all? { |el| el.between?(0, 7) }
  end

  def in_check?(color)
    king_pos = find_king(color)

    opponent_moves = []
    opposing_color = color == :black ? :white : :black
    pieces(opposing_color).each do |piece|
      opponent_moves.concat(piece.moves)
    end

    opponent_moves.include?(king_pos)
  end

  def checkmate?(color)
    in_check?(color) && pieces(color).all? { |piece| piece.valid_moves.empty? }
  end

  def pieces(color)
    pieces = []
    grid.each do |row|
      row.each do |piece|
        pieces << piece if piece.color == color
      end
    end
    pieces
  end

  def all_pieces
    pieces(:white) + pieces(:black)
  end

  def find_king(color)
    king_piece = pieces(color).find do |piece|
      piece.symbol == :king && piece.color == color
    end
    king_piece.pos
  end

  def dup
    new_board = Board.new( Array.new(8) { Array.new(8, NullPiece.instance) })
    all_pieces.each do |piece|
      new_board[piece.pos] = piece.class.new(piece.pos, new_board, piece.color) #adding piece
    end
    new_board
  end
end
