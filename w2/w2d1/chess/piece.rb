require 'singleton'
require 'byebug'

module SlidingPiece
  def moves
    moves = []
    self.move_dirs.each do |dir|
      next_pos = [self.pos[0] + dir[0], self.pos[1] + dir[1]]
      while board.in_bounds?(next_pos) &&
        (board[next_pos] == NullPiece.instance || board[next_pos].color != color)
        moves << next_pos
        next_pos = [next_pos[0] + dir[0], next_pos[1] + dir[1]]
      end
    end

    moves
  end
end

module SteppingPiece
  def moves
    moves = []
    self.move_dirs.each do |dir|
      next_pos = [self.pos[0] + dir[0], self.pos[1] + dir[1]]
      if board.in_bounds?(next_pos) &&
        (board[next_pos] == NullPiece.instance || board[next_pos].color != color)
        moves << next_pos
      end
    end

    moves
  end
end

class Piece
  CARDINALS = [[1, 0], [-1, 0], [0, 1], [0, -1]].freeze
  DIAGONALS = [[-1, -1], [-1, 1], [1, 1], [1, -1]].freeze
  KNIGHT_MOVES = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [ 1, -2],
                  [ 1, 2], [ 2, -1], [ 2, 1]].freeze

  attr_reader :color, :board
  attr_accessor :pos

  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end

  def moves
    []
  end

  def to_s
    " "
  end

  def valid_moves
    moves.reject{|move| move_into_check?(move)}
  end

  def move_into_check?(end_pos)
    # debugger
    new_board = board.dup
    piece_copy = new_board[pos]
    new_board[end_pos], new_board[pos] = piece_copy, NullPiece.instance
    piece_copy.pos = end_pos

    new_board.in_check?(color)
  end
end

class NullPiece < Piece
  include Singleton

  def initialize
  end

  def to_s
    " "
  end
end

class King < Piece
  include SteppingPiece

  def initialize(pos, board, color)
    super
  end

  def symbol
    :king
  end

  def to_s
    color == :white ? "♔" : "♚"
  end

  def move_dirs
    CARDINALS + DIAGONALS
  end
end

class Knight < Piece
  include SteppingPiece

  def initialize(pos, board, color)
    super
  end

  def symbol
    :knight
  end

  def to_s
    color == :white ? "♘" : "♞"
  end

  def move_dirs
    KNIGHT_MOVES
  end
end

class Pawn < Piece
  def initialize(pos, board, color)
    super
  end

  def symbol
    :pawn
  end

  # pawn_moves
  def moves
    moves = []
    move_count = at_start_row? ? 2 : 1
    move_dirs.each do |dir|
      next_pos = self.pos
      move_count.times do
        next_pos = [next_pos[0] + dir[0], next_pos[1] + dir[1]]
        if board.in_bounds?(next_pos) && board[next_pos] == NullPiece.instance
          # may need to change for when implementing jumps
          moves << next_pos
        end
      end
    end

    moves.concat(detect_diagonals)
  end

  def at_start_row?
    (pos.first == 1 && color == :white) || (pos.first == 6 && color == :black)
  end

  def to_s
    color == :white ? "♙" : "♟"
  end

  def move_dirs
    color == :black ? [[-1, 0]] : [[1, 0]]
  end

  def detect_diagonals
    jumps = []
    diags = color == :black ? DIAGONALS[0..1] : DIAGONALS[-2..-1]
    diags.each do |diag|
      next_pos = [pos[0] + diag[0], pos[1] + diag[1]]
      unless board[next_pos].nil? || board[next_pos] == NullPiece.instance ||
        board[next_pos].color == color
        jumps << next_pos
      end
    end

    jumps
  end
end

class Bishop < Piece
  include SlidingPiece

  def initialize(pos, board, color)
    super
  end

  def symbol
    :bishop
  end

  def to_s
    color == :white ? "♗" : "♝"
  end

  def move_dirs
    DIAGONALS
  end
end

class Rook < Piece
  include SlidingPiece

  def initialize(pos, board, color)
    super
  end

  def symbol
    :rook
  end

  def to_s
    color == :white ? "♖" : "♜"
  end

  def move_dirs
    CARDINALS
  end
end

class Queen < Piece
  include SlidingPiece

  def initialize(pos, board, color)
    super
  end

  def symbol
    :queen
  end

  def to_s
    color == :white ? "♕" : "♛"
  end

  def move_dirs
    CARDINALS + DIAGONALS
  end
end
