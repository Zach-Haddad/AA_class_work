require_relative 'deck'

class Hand

  attr_reader :rank, :cards

  def initialize(cards = [])
    @cards = cards
    @rank = 0
  end

  def evaluate_hand
    @rank = 0
    while rank == 0
      @rank = 9
      break if straight_flush?
      @rank = 8
      break if four_kind?
      @rank = 7
      break if full_house?
      @rank = 6
      break if flush?
      @rank = 5
      break if straight?
      @rank = 4
      break if three_kind?
      @rank = 3
      break if two_pair?
      @rank = 2
      break if pair?
      @rank = 1
    end
  end

  def beats?(other_hand)
    evaluate_hand
    other_hand.evaluate_hand
    case @rank <=> other_hand.rank
    when -1 then false
    when 0 then high_card > other_hand.high_card
    when 1 then true
    end
  end

  def straight_flush?
    flush? && straight?
  end

  def four_kind?
    value_hash.value?(4)
  end

  def full_house?
    value_hash.values.select { |el| el == 2 || el == 3 }.length == 2
  end

  def flush?
    suit = @cards[0].suit
    @cards.all? { |card| card.suit == suit }
  end

  def straight?
    values = @cards.map(&:value).sort
    return true if (values.min..values.max).to_a == values
    if values.any? { |v| v == 14 } && values.none? { |v| v == 13 }
      values[-1] = 1
      return true if (values.min..values.max).to_a == values.sort
    end
    false
  end

  def three_kind?
    value_hash.value?(3)
  end

  def two_pair?
    value_hash.values.select { |el| el == 2 }.length == 2
  end

  def pair?
    value_hash.value?(2)
  end

  def high_card
    @cards.max_by { |card| card.value }.value
  end

  def value_hash
    hash = Hash.new(0)
    @cards.each { |card| hash[card.value] += 1 }
    hash
  end


end
