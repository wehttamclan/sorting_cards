require './lib/card'
require './lib/deck'
require './lib/guess'

class Round
attr_reader :deck, :guesses, :number_correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
  end

  def current_card
    deck.cards[0]
  end

  def record_guess(guess)
    current_guess = Guess.new(guess, current_card)
    guesses << current_guess
    deck.cards.rotate!  # deck.cards << deck.cards.shift
    if current_guess.correct?
      @number_correct += 1
    end
    current_guess
  end

  def percent_correct
    (100.0*@number_correct/guesses.length).round
  end

end
