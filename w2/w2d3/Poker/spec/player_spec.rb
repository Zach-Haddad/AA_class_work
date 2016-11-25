require 'rspec'
require 'player'

describe Player do

  subject(:player) { Player.new("Bob") }
  let(:hand) {double('hand', :cards => [1,2,3,4,5])}

  describe '#initialize' do
    it 'begins with a money value of 50' do
      expect(player.money).to eq(50)
    end

    it 'starts with an empty hand' do
      expect(player.hand).to be_a(Hand)
    end
  end

  describe '#discard' do
    it 'accepts an array of indices as an argument' do
      expect{ player.discard([0,1,2]) }.to_not raise_error
    end

    it 'raises an error if the player tries to discard too many cards' do
      expect{ player.discard([0,1,2,3]) }.to raise_error("Cannot discard this many cards")
    end

    it 'should remove the selected cards from the player\'s hand' do
      player.hand = hand
      player.discard([0,1])
      expect(player.hand.cards).to eq([3, 4, 5])
    end

  end

  describe '#bet' do
    context "player raises" do
      it 'raises an error if player tries to bet more money than they have' do
        expect { player.bet(:r, 100) }.to raise_error("Not enough money!")
      end

    end

    context "player sees" do
      it 'matches the current bet'

      it 'checks if there is no current bet'
    end

    context "player folds" do
      it 'sets in_play to false' do
        player.bet(:f)
        expect(player.in_play).to be false
      end

    end

  end


end
