require 'rspec'
require 'deck'

describe Deck do

  subject(:deck) { Deck.new }

  describe '#initialize' do
    it "generates a deck of 52 cards" do
      expect(deck.cards.length).to eq(52)
    end

    it "does not generate duplicate cards" do
      expect(deck.cards.uniq).to eq(deck.cards)
    end
  end

  describe '#fill_deck' do
    it "generates 13 cards of each suit" do
      expect(deck.cards.count {|card| card.suit == :spades}).to eq(13)
      expect(deck.cards.count {|card| card.suit == :clubs}).to eq(13)
      expect(deck.cards.count {|card| card.suit == :diamonds}).to eq(13)
      expect(deck.cards.count {|card| card.suit == :hearts}).to eq(13)
    end
  end

  describe '#shuffle' do
    it "shuffles the deck" do
      expect(deck.cards).to receive(:shuffle!)
      deck.shuffle
    end
  end

  describe '#draw_cards' do
    it "accepts an integer as an argument" do
      expect{deck.draw_cards("a")}.to raise_error(ArgumentError)
    end

    it "limits the number of cards drawn" do
      drawn_cards = deck.draw_cards(53)
      expect(drawn_cards.length).to eq(52)
    end

    it "removes cards from the deck" do
      deck.draw_cards(5)
      expect(deck.cards.length).to eq(47)
    end

    it "returns an array of drawn cards" do
      drawn_cards = deck.draw_cards(5)
      expect(drawn_cards.length).to eq(5)
      expect(drawn_cards).to be_a(Array)
    end
  end
end
