require 'rspec'
require 'game'
require 'byebug'

describe PokerGame do
  let(:p1) { double('p1', :name => "Bob")}
  let(:p2) { double('p2', :name => "Frank")}
  let(:p3) { double('p3', :name => "Stacy")}

  subject(:game) {PokerGame.new(p1, p2)}

  describe '#initialize' do
    it 'accepts multiple players as arguments' do
      expect{PokerGame.new(p1,p2,p3)}.to_not raise_error
    end

    it 'generates a new deck' do
      expect(game.deck).to be_a(Deck)
    end
  end

  describe '#next_player!' do
    it 'sets the current player to the next player' do
      old_player = game.current_player
      game.next_player!
      new_player = game.current_player
      expect(old_player.name).to_not eq(new_player.name)
    end
  end

  describe '#betting_loop' do

  end

  describe '#deal_cards' do

  end

  describe '#determine_winner' do

  end

  describe '#play_round' do
    it "plays a round" do
      expect(game).to receive(:deal_cards)
      game.play_round
      expect(game).to receive(:betting_loop)
      game.play_round
      expect(game).to receive(:determine_winner)
      game.play_round
    end



  end

end
