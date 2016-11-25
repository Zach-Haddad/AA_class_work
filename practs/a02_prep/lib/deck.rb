require_relative 'card'

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def self.all_cards
    deck = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        deck << Card.new(suit, value)
      end
    end

    deck
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    @cards.count
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    taken = []
    raise "not enough cards" if n > @cards.length
    n.times {taken << @cards.shift}
    taken
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    @cards.concat(cards)
  end
end
