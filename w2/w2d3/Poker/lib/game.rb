require_relative 'player'

class PokerGame

  attr_reader :deck, :current_player

  def initialize(*players)
    @players = players
    @current_player = @players[0]
    @deck = Deck.new
    @pot = 0
  end

  def next_player!
    @players.rotate!
    @current_player = @players[0]
  end

  def betting_loop
  end

  def deal_cards
    @players.each do |player|
      while player.hand.cards.length < 5
        player.hand.cards << @deck.draw_cards(1)
      end
    end

  end

  def determine_winner
  end

  def play_round
    deal_cards
    betting_loop
    @players.each { |player| player.discard_round }
    deal_cards
    betting_loop
    determine_winner
  end




end
