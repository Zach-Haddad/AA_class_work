class Game

  ALPHA = ("a".."z").to_a

  def initialize (player1, player2, dictionary)
    @player1 = player1
    @player2 = player2
    @dictionary = File.read(dictionary).split("\n")
    @fragment = ""
    @current_player = [player1, player2].sample
  end

  def play_round
    until over?
      puts "#{@current_player.name} is up!"
      take_turn(@current_player)
      next_player! unless over?
    end

    puts "#{@current_player.name} loses!"
  end

  def current_player
    @current_player
  end

  def previous_player
  end

  def next_player!
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end

  def take_turn(player)
    begin
      puts "The current string is #{@fragment}"
      letter = player.guess.downcase
    raise ArgumentError unless valid_play?(letter)
    rescue ArgumentError
      @current_player.alert_invalid_guess
      retry
    end

    @fragment += letter
    @dictionary.select! {|word| word[0...@fragment.length] == @fragment}
  end

  def valid_play?(string)
    new = @fragment + string
    temp_dict = @dictionary.select {|word| word[0...new.length] == new}
    ALPHA.include?(string) && temp_dict.any?
  end

  def over?
    @dictionary.include?(@fragment)
  end
end

class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess
    puts "Guess a letter!"
    gets.chomp
  end

  def alert_invalid_guess
    puts "Invalid guess! Please try again."
  end
end

if __FILE__ == $PROGRAM_NAME
  bob = Player.new("Bob")
  sarah = Player.new("Sarah")
  game = Game.new(bob, sarah, "dictionary.txt")
  game.play_round
end
