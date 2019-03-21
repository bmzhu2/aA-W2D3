require_relative "deck.rb"

class Hand

  attr_reader :deck, :cards

  def initialize(deck)
    @deck = deck
    @cards = []
  end

  def hand_size
    cards.length
  end

  def draw
    cards << deck.deal
  end

  def discard(*idx_cards)
    unless idx_cards.length == 0
      new_hand = []
      cards.each_with_index do |card, idx|
        new_hand << card unless idx_cards.include?(idx)
      end

      idx_cards.length.times { draw }

      cards = new_hand
    end
    
  end

  def evaluate_hand

  end

  def >(other_hand)

  end

  def [](pos)
    cards[pos]
  end

  def size 
    cards.size
  end

end