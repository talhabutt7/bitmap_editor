require_relative "../IOManager"
require_relative "../Commands"
require_relative "../Canvas"
require_relative "../Utils"
require_relative "../BitmapEditor"

describe BitmapEditor do

  before(:each) do
    @bitmap = BitmapEditor.new(nil)
  end

  describe "#clear_canvas" do
    
    context "before an canvas is created" do
      it "should display an error message" do
        output = @bitmap.process("C")
        expect(output).to eq "You haven't created an canvas yet"
      end
    end

    context "when clearing a blank canvas" do
      it "should not return any output" do
        @bitmap.process("I 7 4")
        output = @bitmap.process("C")
        expect(output).to be_empty
      end

      it "should show the same result as before being cleared" do
        @bitmap.process("I 4 9")
        original = @bitmap.process("S")
        @bitmap.process("C")
        after = @bitmap.process("S")
        expect(after).to eq original
      end
    end

    context "when clearing a valid canvas" do
      it "should reset all the letters back to O" do
        @bitmap.process("I 4 4")
        @bitmap.process("C")
        output1 = @bitmap.process("S")
        expect(output1).to eq "OOOO\nOOOO\nOOOO\nOOOO"
        @bitmap.process("L 2 2 U")
        @bitmap.process("C")
        output2 = @bitmap.process("S")
        expect(output2).to eq "OOOO\nOOOO\nOOOO\nOOOO"
      end
    end

    context "when clearing twice in a row" do
      it "should have no effect" do
        @bitmap.process("I 4 4")
        @bitmap.process("L 2 2 U")
        @bitmap.process("C")
        @bitmap.process("C")
        output = @bitmap.process("S")
        expect(output).to eq "OOOO\nOOOO\nOOOO\nOOOO"
      end
    end

  end

end