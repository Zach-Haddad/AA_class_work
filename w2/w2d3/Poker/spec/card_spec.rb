require 'rspec'
require 'card'

describe Card do
  subject(:card) { Card.new(:spades, 4) }

  describe '#initialize' do
    it "has a suit and value" do
      expect(card.suit).to_not be nil
      expect(card.value).to_not be nil
    end

    it "raises an error if card is not a valid suit" do
      expect { Card.new(:smiley, 5) }.to raise_error(ArgumentError)
    end

    it "raises an error if value of card is out of acceptable range" do
      expect { Card.new(:diamonds, 20) }.to raise_error(ArgumentError)
    end

  end
end
