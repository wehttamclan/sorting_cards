require 'minitest/autorun'
require './lib/card'
require './lib/guess'
require './lib/deck'

class DeckTest < Minitest::Test

  def setup
    @card_1 = Card.new("3","Hearts")
    @card_2 = Card.new("4", "Clubs")
    @card_3 = Card.new("5", "Diamonds")
    @card_4 = Card.new("5", "Clubs")
    @card_5 = Card.new("6","Hearts")
    @card_6 = Card.new("8", "Clubs")
    @card_7 = Card.new("2","Hearts")
    @card_8 = Card.new("1", "Clubs")
  end

  def test_it_exists
    deck = Deck.new([@card_1, @card_2, @card_3])
    assert_instance_of Deck, deck
  end

  def test_cards
    deck = Deck.new([@card_1, @card_2, @card_3])
    assert_equal [@card_1, @card_2, @card_3], deck.cards
  end

  def test_count
    deck = Deck.new([@card_1, @card_2, @card_3])
    assert_equal 3, deck.count
  end

  def test_sort
    deck = Deck.new([@card_1, @card_2, @card_3, @card_4,
                     @card_5, @card_6, @card_7, @card_8])
    sorted_deck = [@card_8, @card_7, @card_1, @card_2,
                   @card_4, @card_5, @card_3, @card_6]
    deck.sort
    assert sorted_deck, deck.cards
  end



end

# assert_equal
# assert
# refute
# refute_equal
# assert_nil
# assert_instance_of
