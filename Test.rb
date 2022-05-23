require_relative "BitmapEditor"
require_relative "Utils"
require "test/unit"

class TestSimpleNumber < Test::Unit::TestCase

  def test_simple
    b = BitmapEditor.new
    b.call("I 5 6")
    assert_equal("OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO", b.call("S"))
  end

end