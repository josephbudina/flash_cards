require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test
  def setup
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @cards = [@card_1, @card_2, @card_3]
        @deck = Deck.new(@cards)
        @round = Round.new(@deck)
    end

  def test_it_exists

    assert_instance_of Round, @round
    assert_instance_of Deck, @round.deck
    assert_equal [], @round.turns
  end

  def test_what_the_current_card_is

    assert_equal @card_1, @round.current_card
  end

   def can_it_take_new_turn
     new_turn = @round.take_turn("Juneau")

     assert_equal Turn, @round.take_turn("Juneau")
     assert_equal Turn, new_turn.class
     assert_equal true, new_turn.turn
   end

end
