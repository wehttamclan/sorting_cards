require 'minitest/autorun'
require './lib/card'
require './lib/guess'

class GuessTest < Minitest::Test

  # def setup
  #   card = Card.new("10", "Hearts")
  #   @guess = Guess.new("10 of Hearts", card)
  # end

  def test_it_exists
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_instance_of Guess, guess
  end

  def test_guess_card_argument
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal card, guess.card
  end

  def test_guess_response_argument
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "10 of Hearts", guess.response
  end

  def test_correct?
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert guess.correct?
  end

  def test_feedback
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "Correct!", guess.feedback
  end

  def test_incorrect_guess_card_argument
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)
    assert_equal card, guess.card
  end

  def test_incorrect_guess_response_argument
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)
    assert_equal "2 of Diamonds", guess.response
  end

  def test_incorrect_correct?
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)
    refute guess.correct?
  end

  def test_incorrect_feedback
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)
    assert_equal "Incorrect.", guess.feedback
  end

end

# assert_equal
# assert
# refute
# refute_equal
# assert_nil
# assert_instance_of
