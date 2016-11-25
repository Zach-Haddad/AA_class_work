require_relative 'hand'

class Player

  attr_reader :name, :money, :in_play
  attr_accessor :hand

  def initialize(name, money = 50)
    @name = name
    @hand = Hand.new
    @money = money
    @in_play = true
  end

  def discard_round
    puts "Which cards do you want to discard? (index positions ie: 1,3,4)"
    discards = gets.chomp.split(',').map(&:to_i)
    discard(discards)
  rescue
    retry
  end

  def betting_round
    puts "How do you want to bet? (r = raise, s = see, f = fold)"
    input = gets.chomp.to_sym
    amount = 0
    if input == :r
      puts "How much would you like to raise?"
      amount = gets.chomp.to_i
    end
    bet(input, amount)
  rescue
    retry
  end

  def discard(arr)
    raise "Cannot discard this many cards" if arr.length > 3
    @hand.cards.reject!.with_index {|_, idx| arr.include?(idx)}
  end

  def bet(sym, amount = 0)
    case sym
    when :r
      raise "Not enough money!" if amount > @money
      amount
    when :s
      0
    when :f
      @in_play = false
      0
    end
  end


end
