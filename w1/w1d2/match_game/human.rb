
require_relative "board"
require_relative 'card'

class HumanPlayer

  attr_accessor :board

  def initialize(name)
    @name = name
    @board = board
  end

  def prompt
    puts "Make a move! [x,y]"
    move = get_move
  end

  def get_move
    move = gets.chomp.split(",").map(&:to_i)
  end
end
