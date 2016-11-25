require 'rspec'
require 'tower'

describe TowerGame do

  subject(:towers) { TowerGame.new }

  describe '#initialize' do

    it 'sets up the towers in a proper configuration' do
      expect(towers.towers).to eq([[1, 2, 3], [], []])
    end
  end

  describe '#move' do
    it "moves a piece to another tower" do
      towers.move(0,1)
      expect(towers.towers).to eq([[2,3],[1],[]])
    end

    it "only moves the lightest object from a tower" do
      towers.move(0,1)
      expect(towers.towers[1]).to_not include(2)
      expect(towers.towers[1]).to_not include(3)
    end
  end

  describe '#valid_move?' do
    it "doesn't allow movement of heavier piece onto lighter piece" do
      towers.move(0,1)
      expect(towers.valid_move?(0,1)).to be false
    end

    it "allows movement onto empty towers" do
      expect(towers.valid_move?(0,1)).to be true
    end

    it "allows movement of lighter piece onto a heavier piece" do
      towers.move(0,1)
      expect(towers.valid_move?(1,0)).to be true
    end
  end

  describe '#won?' do
    it "isn't called on the default state" do
      expect(towers.won?).to be false
    end

    it "returns true if the game is won" do
      towers.move(0,1)
      towers.move(0,2)
      towers.move(1,2)
      towers.move(0,1)
      towers.move(2,0)
      towers.move(2,1)
      towers.move(0,1)
      expect(towers.won?).to be true
    end
  end

end
