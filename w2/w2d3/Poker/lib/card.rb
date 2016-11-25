class Card
  attr_accessor :value, :suit

  SUITS = [:spades, :hearts, :clubs, :diamonds]

  def initialize(suit, value)
    raise ArgumentError unless SUITS.include?(suit)
    raise ArgumentError unless value.between?(2, 14)
    @suit = suit
    @value = value
  end
end
