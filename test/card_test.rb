require 'minitest/autorun'
require './lib/card'


class CardTest < Minitest::Test

  def setup
    @card = Card.new("Ace", "Spades")
  end

  def test_it_exists
    assert_instance_of Card, @card
  end

  def test_value
    assert_equal "Ace", @card.value
  end

  def test_suit
    assert_equal "Spades", @card.suit
  end




end

# assert_equal
# assert
# refute
# refute_equal
# assert_nil
# assert_instance_of
