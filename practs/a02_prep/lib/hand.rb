class Hand
  require_relative 'deck'
  # This is called a *factory method*; it's a *class method* that
  # takes the a `Deck` and creates and returns a `Hand`
  # object. This is in contrast to the `#initialize` method that
  # expects an `Array` of cards to hold.
  def self.deal_from(deck, n)
    Hand.new(deck.take(n))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    sum = 0
    cards.sort_by {|card| card.value}.reverse!.each do |card|
      begin
      sum += card.blackjack_value
      rescue
        next
      end
    end

    aces = cards.count {|card| card.value == :ace}
    if aces == 1 && sum <= 10
      sum += 11
    elsif aces == 1 && sum > 10
      sum += 1
    elsif aces > 1
      until sum > 10
        sum += 11
        aces -= 1
      end
      sum += aces
    end

    sum

    # got stuck here :(
  end

  def busted?
    return false if points.nil?
    points > 21
  end

  def hit(deck)
    raise "already busted" if busted?
    @cards << deck.take(1)
  end

  def beats?(other_hand)
    return false if busted?
    points > other_hand.points
  end

  def return_cards(deck)
    deck.return(cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
