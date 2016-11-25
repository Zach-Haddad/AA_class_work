require_relative 'card'

class Deck

  attr_reader :cards

  def initialize
    @cards = []
    fill_deck
  end

  def fill_deck
    [:spades, :hearts, :clubs, :diamonds].each do |suit|
      (2..14).each do |val|
        @cards << Card.new(suit, val)
      end
    end

    shuffle
  end

  def shuffle
    @cards.shuffle!
  end

  def draw_cards(num)
    raise ArgumentError unless num.is_a? Integer

    num = cards.length if num > cards.length
    drawn_cards = []
    num.times {drawn_cards << cards.pop}
    drawn_cards
  end

end
