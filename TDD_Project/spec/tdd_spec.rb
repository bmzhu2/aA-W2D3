require 'tdd'

RSpec.describe Array do

  describe '#my_uniq' do
    it 'should eliminate duplicate values' do
      expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
    end

    it 'should retain order which elements first appeared' do
      expect([3, 1, 2, 3].my_uniq).to eq([3, 1, 2])
    end
  end

  describe "#two_sum" do
    it 'should return the indices of pairs that sum to zero' do
      expect([-1,0,2,-2,1].two_sum).to eq([[0,4],[2,3]])
    end

    it 'the pairs should be sorted "dictionary-wise"' do
      expect([-1,-1,1,2].two_sum).to eq([[0,2],[1,2]])
    end
  end

end

describe '#my_transpose' do
  it 'returns a new array where the rows are now the columns' do
    expect(my_transpose([[0,1,2],[3,4,5],[6,7,8]])).to eq([[0,3,6],[1,4,7],[2,5,8]])
  end
end

describe '#stock_picker' do
  it 'keeps the day order chronological' do
    expect(stock_picker([1, 2])).to eq([0,1])
  end
  
  it 'finds the most profitable pair of days to buy and sell the stock' do
    expect(stock_picker([2, 3, 5, 4, 7, 4, 6])).to eq([0, 4])
  end

  it 'makes sure you cannot sell a stock before you buy it' do
    expect(stock_picker([3, 5, 6, 2, 4])).to eq([0, 2])
  end  
end

describe TowersOfHanoi do
  subject(:towers) {TowersOfHanoi.new(4)}
  
  describe '#initialize' do 
    it 'takes a size' do
      expect(towers.size).to eq(4)
    end

    it 'sets the left peg with disks according to the size' do
      expect(towers.left.size).to eq(4)
    end

    it 'puts the disks on left peg in order from largest to smallest' do
      expect(towers.left).to eq([4,3,2,1])
    end

    it 'should create empty middle and right pegs' do
      expect(towers.middle).to be_empty
      expect(towers.right).to be_empty
    end
  end

  describe "#move" do
    it "should take the first disc from the peg and move it to the target peg" do
      towers.move(towers.left, towers.right)
      expect(towers.left).to eq([4, 3, 2])
      expect(towers.right).to eq([1])
    end

    it 'should throw an error if the pegs first disc is bigger than the targets first disc' do
      towers.right << towers.left.pop
      expect { towers.move(towers.left, towers.right) }.to raise_error('disc is too big to move there')
    end

    it 'should throw an error if the selected peg is empty' do
      expect { towers.move(towers.right, towers.left) }.to raise_error('selected peg is empty')
    end

    it 'should throw an error if any of the pegs are invalid' do
      expect { towers.move(:south, towers.left) }.to raise_error('invalid peg')
    end

    it 'should throw an error if selected peg and target peg are the same' do
      expect { towers.move(towers.left, towers.left) }.to raise_error('cannot choose same peg as target')
    end
  end

  describe '#won?' do
  
    subject(:tower2) { TowersOfHanoi.new(2) }
    
    it 'should return true if all of the discs are on the right' do
      tower2.move(tower2.left, tower2.middle)
      tower2.move(tower2.left, tower2.right)
      tower2.move(tower2.middle, tower2.right)
      expect(tower2.won?).to be true
    end

    it 'should return false if not all discs are on the right' do
      tower2.move(tower2.left, tower2.middle)
      tower2.move(tower2.left, tower2.right)
      expect(tower2.won?).to be false
    end

  end



end