require_relative "../IOManager"
require_relative "../Commands"
require_relative "../Canvas"
require_relative "../Utils"
require_relative "../BitmapEditor"

describe Commands do

  describe "#inputs" do

    before(:each) do
      @c = Commands.new("", BitmapEditor.new(nil))
    end

    context "empty input" do
      it "should be an empty list" do
        expect(@c.inputs("")).to eq []
      end
    end

    context "multiple arguments" do
      it "should be a list split up by new lines" do
        expect(@c.inputs("U 1 2 3 4 5")).to eq ["1", "2", "3", "4", "5"]
        expect(@c.inputs("B K U P")).to eq ["K", "U", "P"]
      end
      
      it "should should have one element missing" do
        str = "U 1 2 3 4 5"
        output = @c.inputs(str)
        expect(str.strip.split(" ")[0]).to_not eq output[0]
      end
    end

    context "single argument" do
      it "should be an empty list" do
        expect(@c.inputs("H")).to eq []
        expect(@c.inputs("4526")).to eq []
        expect(@c.inputs("mOKUSF")).to eq []
      end
    end

  end

end