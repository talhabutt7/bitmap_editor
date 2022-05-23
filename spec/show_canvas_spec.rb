require_relative "../IOManager"
require_relative "../Commands"
require_relative "../Canvas"
require_relative "../Utils"
require_relative "../BitmapEditor"

describe BitmapEditor do

  before(:each) do
    @bitmap = BitmapEditor.new(nil)
  end

  describe "#show_canvas" do
    
    context "after creating a valid canvas" do
      it "should print the correct representation" do
        @bitmap.process("I 5 6")
        output = @bitmap.process("S")
        expect(output).to eq "OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO"
        @bitmap.process("I 3 3")
        output = @bitmap.process("S")
        expect(output).to eq "OOO\nOOO\nOOO"
      end
    end

    context "if no canvas has been created" do
      it "should give an error message" do
        output = @bitmap.process("S")
        expect(output).to eq "You haven't created an canvas yet"
      end
    end

  end

end