require './lib/card'


class Deck
attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def sort
    while sort_once
      sort_once
    end
  end

  def sort_once
    swaps = false
    (cards.length-1).times do |i|
      if @cards[i].value > @cards[i+1].value
        swap_cards(i)
        swaps = true
      end
    end
    swaps
  end

  def swap_cards(i)
    cards[i], cards[i+1] = cards[i+1], cards[i]
  end


end
