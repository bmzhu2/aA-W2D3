require 'deck'

RSpec.describe Card do

  describe '#initialize' do
    subject(:card) {Card.new(30)}

    it 'takes an integer from 0-51 and sets suit and rank based on it' do
      expect(card.rank).to eq(9)
      expect(card.suit).to eq(:hearts)
    end

  end

end

describe Deck do
  subject(:deck) {Deck.new}

  describe '#initialize' do
    it 'should have a stack of 52 cards' do
      expect(deck.cards.size).to eq(52)
    end

    it 'should populate deck with instances of cards' do
      expect(deck.cards[11].class).to eq(Card)
    end
  end

  describe '#shuffle!' do
    it 'should randomize order of the cards in the deck' do
      deck.shuffle!
      expect(deck.cards[0].rank).to_not eq(2)
    end
  end

  describe '#deal' do

    it 'should return the top card of the deck' do
      expect(deck.deal.rank).to eq(14)
    end

    it 'should remove the top card from the deck' do
      deck.deal
      expect(deck.cards[-1].suit).to_not eq(:spades)
    end
  end
end