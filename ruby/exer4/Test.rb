require "test/unit"
require_relative "exer"

class TestSkipSports < Test::Unit::TestCase
  def test_init
    skip = Skip.new(["Football", "Cricket", "Volleyball", "Hockey"])
    assert skip.is_a? Skip
  end

  def test_skip_sports
    skip = Skip.new(["Football", "Cricket", "Volleyball", "Hockey"])
    assert_equal(skip.skip_sports(2), ["2Volleyball", "3Hockey"])
  end

  def test_skip_inval_sports
    skip = Skip.new(["Football", "Cricket", "Volleyball", "Hockey"])
    assert_equal(skip.skip_sports(-1), [])
  end
end
