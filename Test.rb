require_relative "IOManager"
require_relative "Commands"
require_relative "Image"
require_relative "Utils"
require_relative "BitmapEditor"
require "test/unit"

class TestBitmapEditor < Test::Unit::TestCase

  # Test the new_image functions
  def test_new_image
    x = BitmapEditor.new(nil)
    assert_equal("You haven't created an image yet", x.process("S"))
    assert_equal("", x.process("I 5 6"))
    assert_equal("OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO", x.process("S"))
    assert_equal("The image must be at minimum 1x1", x.process("I 0 9"))
    assert_equal("X and Y must both be numbers", x.process("I B 9"))
    assert_equal("You should only enter 2 value(s) after the 'I'", x.process("I 8 7 2"))
    assert_equal("The maximum width and height is 250", x.process("I 300 62"))
    assert_equal("", x.process("I 3 3"))
    assert_equal("OOO\nOOO\nOOO", x.process("S"))
  end

  # Test the clear_image function
  def test_clear_image
    x = BitmapEditor.new(nil)
    assert_equal("You haven't created an image yet", x.process("C"))
    assert_equal("", x.process("I 4 4"))
    assert_equal("", x.process("C"))
    assert_equal("OOOO\nOOOO\nOOOO\nOOOO", x.process("S"))
    assert_equal("", x.process("L 2 2 U"))
    assert_equal("", x.process("C"))
    assert_equal("OOOO\nOOOO\nOOOO\nOOOO", x.process("S"))
  end

  # Test the set_pixel_colour function
  def test_set_pixel_colour
    x = BitmapEditor.new(nil)
    assert_equal("You should only enter 3 value(s) after the 'L'", x.process("L 123"))
    assert_equal("You haven't created an image yet", x.process("L 1 2 3"))
    assert_equal("", x.process("I 4 5"))
    assert_equal("Colours must be capital letters", x.process("L 1 2 3"))
    assert_equal("", x.process("L 1 2 K"))
    assert_equal("OOOO\nKOOO\nOOOO\nOOOO\nOOOO", x.process("S"))
    assert_equal("You entered a pixel which isn't in the image", x.process("L 0 4 X"))
    assert_equal("You entered a pixel which isn't in the image", x.process("L 7 2 Z"))
    assert_equal("", x.process("L 4 3 F"))
    assert_equal("OOOO\nKOOO\nOOOF\nOOOO\nOOOO", x.process("S"))
    assert_equal("", x.process("L 1 2 J"))
    assert_equal("OOOO\nJOOO\nOOOF\nOOOO\nOOOO", x.process("S"))
  end

  # Test the draw_line function
  def test_draw_line
    x = BitmapEditor.new(nil)
    assert_equal("You haven't created an image yet", x.process("H 3 4 9 J"))
    assert_equal("You haven't created an image yet", x.process("V 8 5 2 A"))
    assert_equal("", x.process("I 8 7"))
    assert_equal("", x.process("H 2 7 3 B"))
    assert_equal("OOOOOOOO\nOOOOOOOO\nOBBBBBBO\nOOOOOOOO\nOOOOOOOO\nOOOOOOOO\nOOOOOOOO", x.process("S"))
    assert_equal("", x.process("C"))
    assert_equal("", x.process("V 7 3 5 D"))
    assert_equal("OOOOOOOO\nOOOOOOOO\nOOOOOODO\nOOOOOODO\nOOOOOODO\nOOOOOOOO\nOOOOOOOO", x.process("S"))
    assert_equal("You should only enter 4 value(s) after the 'H'", x.process("H 1 1 1 1 D"))
    assert_equal("Colours must be capital letters", x.process("H 1 2 7 3"))
    assert_equal("", x.process("H 1 5 2 M"))
    assert_equal("", x.process("H 1 8 5 P"))
    assert_equal("OOOOOOOO\nMMMMMOOO\nOOOOOODO\nOOOOOODO\nPPPPPPPP\nOOOOOOOO\nOOOOOOOO", x.process("S"))
  end

  # Further tests
  def test_further
    x = BitmapEditor.new(nil)
    assert_equal("Please type a valid command, type ? for help", x.process(""))
    assert_equal("Please type a valid command, type ? for help", x.process("   "))
    assert_equal("Please type a valid command, type ? for help", x.process("9kdj"))
    assert_equal("You should only enter 3 value(s) after the 'L'", x.process("l82"))
    assert_equal("You haven't created an image yet", x.process("s23"))
    x2 = BitmapEditor.new(IOManager.new)
    assert_equal("Thanks for running the program!", x2.process("x89 1akj"))
  end

end