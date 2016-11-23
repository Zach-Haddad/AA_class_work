
class HumanPlayer

  attr_reader :name, :cursor, :color

  def initialize(name, cursor, color)
    @name = name
    @cursor = cursor
    @color = color
  end

  def play_turn
    cursor.get_input
  end
end
