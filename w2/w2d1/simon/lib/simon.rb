class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until game_over

    if game_over
      game_over_message
      reset_game
    end
  end

  def take_turn
    show_sequence
    require_sequence
    @game_over = true if @user_seq != @seq

    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each{|color| puts color}
  end

  def require_sequence
    puts "enter the sequence"
    @user_seq = gets.chomp.split(" ")
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    "Correct!"
  end

  def game_over_message
    "Game Over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

new = Simon.new
new.play
