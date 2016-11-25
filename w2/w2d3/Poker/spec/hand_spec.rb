require 'rspec'
require 'hand'

describe Hand do
  subject(:hand) { Hand.new }
  let(:card1) { double("card1") }
  let(:card2) { double("card2") }
  let(:card3) { double("card3") }
  let(:card4) { double("card4") }
  let(:card5) { double("card5") }
  let(:card6) { double("card6") }
  let(:card7) { double("card7") }
  let(:card8) { double("card8") }
  let(:card9) { double("card9") }
  let(:card10) { double("card10") }

  describe '#initialize' do
    it 'starts with an empty hand' do
      expect(hand.cards).to be_empty
    end

    it 'starts with a rank of zero' do
      expect(hand.rank).to eq(0)
    end

  end

  context "full hand of cards" do
    let(:full_hand) { Hand.new([card1,card2,card3,card4,card5]) }

    describe '#evaluate_hand' do

      it 'changes the rank of a hand' do
        allow(card1).to receive(:value).and_return(5)
        allow(card2).to receive(:value).and_return(8)
        allow(card3).to receive(:value).and_return(8)
        allow(card4).to receive(:value).and_return(8)
        allow(card5).to receive(:value).and_return(2)

        allow(card1).to receive(:suit).and_return(:hearts)
        allow(card2).to receive(:suit).and_return(:diamonds)
        allow(card3).to receive(:suit).and_return(:diamonds)
        allow(card4).to receive(:suit).and_return(:diamonds)
        allow(card5).to receive(:suit).and_return(:diamonds)
        full_hand.evaluate_hand
        expect(full_hand.rank).to eq(4)
      end

      it "doesn't check for hands of lesser value" do
        allow(card1).to receive(:value).and_return(5)
        allow(card2).to receive(:value).and_return(8)
        allow(card3).to receive(:value).and_return(8)
        allow(card4).to receive(:value).and_return(8)
        allow(card5).to receive(:value).and_return(2)

        allow(card1).to receive(:suit).and_return(:hearts)
        allow(card2).to receive(:suit).and_return(:diamonds)
        allow(card3).to receive(:suit).and_return(:diamonds)
        allow(card4).to receive(:suit).and_return(:diamonds)
        allow(card5).to receive(:suit).and_return(:diamonds)
        expect(full_hand).to_not receive(:two_pair?)
        full_hand.evaluate_hand
      end

    end

    describe '#beats?' do

      let(:dummy_hand) { Hand.new([card6, card7, card8, card9, card10]) }

      it 'accepts another hand as an argument' do
        expect{ full_hand.beats?(dummy_hand) }.to_not raise_error(RuntimeError)
      end


      it 'returns true for a winning hand' do
      #our hand
        allow(card1).to receive(:value).and_return(5)
        allow(card2).to receive(:value).and_return(8)
        allow(card3).to receive(:value).and_return(8)
        allow(card4).to receive(:value).and_return(8)
        allow(card5).to receive(:value).and_return(2)

        allow(card1).to receive(:suit).and_return(:hearts)
        allow(card2).to receive(:suit).and_return(:diamonds)
        allow(card3).to receive(:suit).and_return(:diamonds)
        allow(card4).to receive(:suit).and_return(:diamonds)
        allow(card5).to receive(:suit).and_return(:diamonds)
      #dummy hand
        allow(card6).to receive(:value).and_return(5)
        allow(card7).to receive(:value).and_return(6)
        allow(card8).to receive(:value).and_return(8)
        allow(card9).to receive(:value).and_return(8)
        allow(card10).to receive(:value).and_return(2)

        allow(card6).to receive(:suit).and_return(:hearts)
        allow(card7).to receive(:suit).and_return(:diamonds)
        allow(card8).to receive(:suit).and_return(:spades)
        allow(card9).to receive(:suit).and_return(:spades)
        allow(card10).to receive(:suit).and_return(:diamonds)

        expect(full_hand.beats?(dummy_hand)).to be true

      end

      it 'returns false for a losing hand' do
        #our hand
        allow(card1).to receive(:value).and_return(5)
        allow(card2).to receive(:value).and_return(8)
        allow(card3).to receive(:value).and_return(8)
        allow(card4).to receive(:value).and_return(8)
        allow(card5).to receive(:value).and_return(2)

        allow(card1).to receive(:suit).and_return(:hearts)
        allow(card2).to receive(:suit).and_return(:diamonds)
        allow(card3).to receive(:suit).and_return(:diamonds)
        allow(card4).to receive(:suit).and_return(:diamonds)
        allow(card5).to receive(:suit).and_return(:diamonds)
        #dummy hand
        allow(card6).to receive(:value).and_return(9)
        allow(card7).to receive(:value).and_return(9)
        allow(card8).to receive(:value).and_return(9)
        allow(card9).to receive(:value).and_return(9)
        allow(card10).to receive(:value).and_return(2)

        allow(card6).to receive(:suit).and_return(:hearts)
        allow(card7).to receive(:suit).and_return(:diamonds)
        allow(card8).to receive(:suit).and_return(:spades)
        allow(card9).to receive(:suit).and_return(:spades)
        allow(card10).to receive(:suit).and_return(:diamonds)

        expect(full_hand.beats?(dummy_hand)).to be false
      end
    end

    describe '#straight_flush?' do
      it 'calls straight? and flush?' do
        allow(card1).to receive(:suit).and_return(:diamonds)
        allow(card2).to receive(:suit).and_return(:diamonds)
        allow(card3).to receive(:suit).and_return(:diamonds)
        allow(card4).to receive(:suit).and_return(:diamonds)
        allow(card5).to receive(:suit).and_return(:diamonds)

        allow(card1).to receive(:value).and_return(2)
        allow(card2).to receive(:value).and_return(3)
        allow(card3).to receive(:value).and_return(4)
        allow(card4).to receive(:value).and_return(5)
        allow(card5).to receive(:value).and_return(6)

        expect(full_hand).to receive(:straight?)
        full_hand.straight_flush?
        expect(full_hand).to receive(:flush?)
        full_hand.straight_flush?
      end
    end

    describe '#four_kind?' do
      it 'return true if hand has 4 cards of the same value' do
        allow(card1).to receive(:value).and_return(8)
        allow(card2).to receive(:value).and_return(8)
        allow(card3).to receive(:value).and_return(8)
        allow(card4).to receive(:value).and_return(8)
        allow(card5).to receive(:value).and_return(2)
        expect(full_hand.four_kind?).to be true
      end

      it 'returns false if < 4 cards share a value' do
        allow(card1).to receive(:value).and_return(5)
        allow(card2).to receive(:value).and_return(8)
        allow(card3).to receive(:value).and_return(8)
        allow(card4).to receive(:value).and_return(8)
        allow(card5).to receive(:value).and_return(2)
        expect(full_hand.four_kind?).to be false
      end
    end

    describe '#full_house?' do

      it 'returns true if remaining pair have distinct but shared value' do
        allow(card1).to receive(:value).and_return(5)
        allow(card2).to receive(:value).and_return(8)
        allow(card3).to receive(:value).and_return(5)
        allow(card4).to receive(:value).and_return(8)
        allow(card5).to receive(:value).and_return(8)
        expect(full_hand.full_house?).to be true
      end

    end

    describe '#flush?' do
      it 'returns true if all cards share a suit' do
        allow(card1).to receive(:suit).and_return(:diamonds)
        allow(card2).to receive(:suit).and_return(:diamonds)
        allow(card3).to receive(:suit).and_return(:diamonds)
        allow(card4).to receive(:suit).and_return(:diamonds)
        allow(card5).to receive(:suit).and_return(:diamonds)
        expect(full_hand.flush?).to be true
      end

      it 'returns false if cards differ in suit' do
        allow(card1).to receive(:suit).and_return(:hearts)
        allow(card2).to receive(:suit).and_return(:diamonds)
        allow(card3).to receive(:suit).and_return(:diamonds)
        allow(card4).to receive(:suit).and_return(:diamonds)
        allow(card5).to receive(:suit).and_return(:diamonds)
        expect(full_hand.flush?).to be false
      end
    end

    describe '#straight?' do
      it 'returns true if all cards have consecutive value' do
        allow(card1).to receive(:value).and_return(2)
        allow(card2).to receive(:value).and_return(3)
        allow(card3).to receive(:value).and_return(4)
        allow(card4).to receive(:value).and_return(5)
        allow(card5).to receive(:value).and_return(6)
        expect(full_hand.straight?).to be true
      end

      it 'accounts for aces being high and low' do
        allow(card1).to receive(:value).and_return(2)
        allow(card2).to receive(:value).and_return(3)
        allow(card3).to receive(:value).and_return(4)
        allow(card4).to receive(:value).and_return(5)
        allow(card5).to receive(:value).and_return(14)
        expect(full_hand.straight?).to be true
      end

    end

    describe '#three_kind?' do
      it 'returns true if hand has 3 cards of the same value' do
        allow(card1).to receive(:value).and_return(8)
        allow(card2).to receive(:value).and_return(8)
        allow(card3).to receive(:value).and_return(7)
        allow(card4).to receive(:value).and_return(8)
        allow(card5).to receive(:value).and_return(2)
        expect(full_hand.three_kind?).to be true
      end

      it 'returns false if < 3 cards share a value' do
        allow(card1).to receive(:value).and_return(5)
        allow(card2).to receive(:value).and_return(8)
        allow(card3).to receive(:value).and_return(7)
        allow(card4).to receive(:value).and_return(8)
        allow(card5).to receive(:value).and_return(2)
        expect(full_hand.three_kind?).to be false
      end
    end

    describe '#two_pair?' do
      it 'returns true if two pairs of cards have distinct but shared values' do
        allow(card1).to receive(:value).and_return(5)
        allow(card2).to receive(:value).and_return(8)
        allow(card3).to receive(:value).and_return(5)
        allow(card4).to receive(:value).and_return(8)
        allow(card5).to receive(:value).and_return(2)
        expect(full_hand.two_pair?).to be true
      end

      it 'returns false for a 4 of a kind' do
        allow(card1).to receive(:value).and_return(5)
        allow(card2).to receive(:value).and_return(5)
        allow(card3).to receive(:value).and_return(5)
        allow(card4).to receive(:value).and_return(5)
        allow(card5).to receive(:value).and_return(2)
        expect(full_hand.two_pair?).to be false
      end

    end

    describe '#pair?' do
      it 'returns true if two cards share a value' do
        allow(card1).to receive(:value).and_return(5)
        allow(card2).to receive(:value).and_return(8)
        allow(card3).to receive(:value).and_return(7)
        allow(card4).to receive(:value).and_return(8)
        allow(card5).to receive(:value).and_return(2)
        expect(full_hand.pair?).to be true
      end

    end

    describe '#high_card' do
      it 'returns the highest card value in the hand' do
        allow(card1).to receive(:value).and_return(5)
        allow(card2).to receive(:value).and_return(12)
        allow(card3).to receive(:value).and_return(7)
        allow(card4).to receive(:value).and_return(8)
        allow(card5).to receive(:value).and_return(2)
        expect(full_hand.high_card).to eq(12)
      end
    end
  end

end
