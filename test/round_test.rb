require 'minitest/autorun'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("3","Hearts")
    @card_2 = Card.new("4", "Clubs")
    @card_3 = Card.new("5", "Diamonds")
  end

  def test_it_exists
    deck = Deck.new([@card_1, @card_2])
    round = Round.new(deck)
    assert_instance_of Round, round
  end

  def test_deck_argument
    deck = Deck.new([@card_1, @card_2])
    round = Round.new(deck)
    assert_instance_of Deck, round.deck
  end

  def test_guesses_collection
    deck = Deck.new([@card_1, @card_2])
    round = Round.new(deck)
    assert_equal [], round.guesses
  end

  def test_current_card
    deck = Deck.new([@card_1, @card_2])
    round = Round.new(deck)
    assert_equal @card_1, round.current_card
    round.record_guess("3 of Hearts")
    assert_equal @card_2, round.current_card
  end

  def test_record_guess
    deck = Deck.new([@card_1, @card_2])
    round = Round.new(deck)
    assert_nil round.guesses[0]
    round.record_guess("3 of Hearts")
    refute_nil round.guesses[0]
    round.record_guess("Jack of Diamonds")
    assert_equal 2, round.guesses.length
  end

  def test_count_guesses
    deck = Deck.new([@card_1, @card_2])
    round = Round.new(deck)
    round.record_guess("3 of Hearts")
    assert_equal 1, round.guesses.count
    round.record_guess("Jack of Diamonds")
    assert_equal 2, round.guesses.count
  end

  def test_feedback
    deck = Deck.new([@card_1, @card_2])
    round = Round.new(deck)
    round.record_guess("3 of Hearts")
    assert_equal "Correct!", round.guesses.first.feedback
    round.record_guess("Jack of Diamonds")
    assert_equal "Incorrect.", round.guesses.last.feedback
  end

  def test_number_correct
    deck = Deck.new([@card_1, @card_2])
    round = Round.new(deck)
    round.record_guess("3 of Hearts")  # correct
    assert_equal 1, round.number_correct
    round.record_guess("Jack of Diamonds")  # incorrect
    assert_equal 1, round.number_correct
  end

  def test_percent_correct
    deck = Deck.new([@card_1, @card_2, @card_3])
    round = Round.new(deck)
    round.record_guess("3 of Hearts")       # correct
    round.record_guess("Jack of Diamonds")  # incorrect
    round.record_guess("5 of Diamonds")     # correct
    assert_equal 67, round.percent_correct
  end

end

# assert_equal
# assert
# refute
# refute_equal
# assert_nil
# assert_instance_of
