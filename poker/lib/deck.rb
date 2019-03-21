class Deck
  attr_reader :cards
  
  def initialize
    @cards = (0..51).to_a.map {|val| Card.new(val)}
  end

  def shuffle!
    cards.shuffle!
  end

  def deal
    cards.pop
  end

end

class Card

  attr_reader :rank, :suit

  SUITS = [:clubs, :diamonds, :hearts, :spades]

  def initialize(value)
    @rank = (value / 4) + 2
    @suit = SUITS[value % 4]
  end

end