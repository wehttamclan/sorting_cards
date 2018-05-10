require './lib/card'

class Guess
attr_reader :response, :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  def answer
    card.value + " of " + card.suit
  end

  def correct?
    answer == @response
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end


end
