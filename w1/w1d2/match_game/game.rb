require_relative 'board'
require_relative 'card'
require_relative 'human'

class Game

attr_accessor :board, :player

  def initialize(player, board=Board.new)
    @board = board
    @player = player
  end

  def play
    board.make_grid
    board.populate
    board.render

    until board.won?
      first_move = player.prompt
      flip_move(first_move)
      board.render
      second_move = player.prompt
      flip_move(second_move)
      board.render

      unless @board.grid[first_move.first][first_move.last]==
        @board.grid[second_move.first][second_move.last]
        @board.board_flip(first_move)
        @board.board_flip(second_move)
        puts
        board.render
      end
    end

    puts "You won!"
  end


def flip_move(move)
  @board.board_flip(move)
  #move
end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new(player = HumanPlayer.new("self"))
  game.play
end
