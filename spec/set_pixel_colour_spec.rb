require_relative "../IOManager"
require_relative "../Commands"
require_relative "../Canvas"
require_relative "../Utils"
require_relative "../BitmapEditor"

describe BitmapEditor do

  before(:each) do
    @bitmap = BitmapEditor.new(nil)
  end

  describe "#set_pixel_colour" do
    
    context "before an canvas is created" do
      it "should display an error message" do
        output = @bitmap.process("L 1 2 3")
        expect(output).to eq "You haven't created an canvas yet"
      end
    end

    context "when entering wrong number of inputs" do
      it "should tell you how many inputs to enter after the 'L'" do
        output = @bitmap.process("L 123")
        expect(output).to eq "You should only enter 3 value(s) after the 'L'"
      end
    end

    context "when not typing capital letters for colours" do
      it "should not let you colour the canvas" do
        @bitmap.process("I 4 5")
        message = @bitmap.process("L 1 2 3")
        expect(message).to eq "Colours must be capital letters"
      end
      
      it "should show the canvas unaffected" do
        @bitmap.process("I 4 5")
        original = @bitmap.process("S")
        @bitmap.process("L 1 2 3")
        after = @bitmap.process("S")
        expect(after).to eq original
      end
    end

    context "when trying to colour a pixel not in the canvas" do
      it "should show an error message" do
        @bitmap.process("I 4 5")
        error = @bitmap.process("L 0 4 X")
        expect(error).to eq "You entered a pixel which isn't in the canvas"
        error2 = @bitmap.process("L 7 2 Z")
        expect(error2).to eq "You entered a pixel which isn't in the canvas"
      end
    end

    context "setting the colour of a valid pixel" do
      it "should modify only one pixel" do
        @bitmap.process("I 4 5")
        @bitmap.process("L 1 2 K")
        @bitmap.process("L 4 3 F")
        first = @bitmap.process("S")
        expect(first).to eq "OOOO\nKOOO\nOOOF\nOOOO\nOOOO"
        @bitmap.process("L 1 2 J")
        second = @bitmap.process("S")
        expect(second).to eq "OOOO\nJOOO\nOOOF\nOOOO\nOOOO"
      end
      
      it "should not display any errors" do
        @bitmap.process("I 8 2")
        output = @bitmap.process("L 1 2 N")
        expect(output).to be_empty
      end
    end

  end

end