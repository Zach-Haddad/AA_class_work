
require_relative "board"
require_relative 'card'

class ComputerPlayer

  attr_accessor :board

  def initialize
    @previous_values = {}
  end

  POSITIONS = []
  (0..3).each do |x|
    (0..3).each {|y| POSITIONS << [x,y]}
  end
  KEY = 0

  def prompt
  end


  # def first_guess
  #   if @previous_values.any? {|k,v| @previous_values[k].length == 2}
  #     first_guess = @previous_values.select {|k,v| @previous_values[k].length == 2}.values
  #     first_guess = first_guess.first.first
  #   else
  #     first_guess = random_guess
  #     #add face value => pos to hash
  #   end
  #
  #   #key = board.grid[first_guess.first][first_guess.last].face_value
  #   #  @previous_values[key] += first_guess
  #   KEY = board.grid[first_guess.first][first_guess.last].face_value
  #   @previous_values[KEY] += first_guess
  # end
  #
  # def second_guess
  #   if @previous_values.any? {|k,v| @previous_values[k].length == 2}
  #     second_guess = @previous_values.select {|k,v| @previous_values[k].length == 2}.values
  #     second_guess = second_guess.first.last
  #   elsif @previous_values.has_key?(KEY)
  #     second_guess = @previous_values[KEY]
  #   else
  #     second_guess = random_guess
  #   end
  #   KEY = board.grid[second_guess.first][second_guess.last].face_value
  #   @previous_values[KEY] += second_guess
  # end

  def random_guess
    POSITIONS.sample
  end



end
