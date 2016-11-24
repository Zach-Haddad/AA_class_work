require_relative 'display'
require_relative 'cursor'
require_relative 'board'
require_relative 'player'

class Game

  def initialize(player1, player2)
    @board = Board.new
    @cursor = Cursor.new([0, 0], @board)
    @display = Display.new(@board, @cursor)
    @player1 = HumanPlayer.new(player1, @cursor, :white)
    @player2 = HumanPlayer.new(player2, @cursor, :black)
    @current_player = @player1
  end

  def play
    until over?
      begin
        move = []

        until move.length == 2
          system("clear")
          puts "#{@current_player.name} is up!"
          @display.render
          pos = @current_player.play_turn
          move << pos unless pos.nil?
        end
        @board.move_piece(move[0], move[1])
      rescue
        puts "Invalid move! Try again."
        sleep(0.5)
        retry
      end
      swap_turn!
    end

    puts "Game Over! #{winner.namegit } wins!"
  end

  def swap_turn!
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def over?
    @board.checkmate?(:black) || @board.checkmate?(:white)
  end

  def winner
    @board.checkmate?(:black) ? @player1 : @player2
  end

end

Game.new("Zach", "Nick").play
