require 'hand'

RSpec.describe Hand do
  let(:deck) {double('deck', :deal => Card.new(2))}
  subject(:hand) { Hand.new(deck) }

  describe '#initialize' do
    it 'should take in a deck object' do
      expect(hand.deck).to_not be(nil)
    end
  end

  describe '#draw' do
    it 'should add one card from the deck to the hand' do
      expect(deck).to receive(:deal)
      hand.draw
      expect(hand.cards[0].rank).to eq(2)
    end
  end

  describe '#discard' do
    before :each do
      5.times { hand.draw }
    end

    it 'should remove the cards at the given indices' do
      first_card = hand[0]
      hand.discard(0)
      expect(hand[0]).to_not eq(first_card)
    end

    it 'should not do anything if no arguments are given' do
      before = hand
      hand.discard
      expect(before.cards).to eq(hand.cards)
    end

    it 'it should repopulate the hand to five cards' do
      hand.discard(0, 1)
      expect(hand.size).to eq(5)
    end
  end


end