require_relative "../IOManager"
require_relative "../Commands"
require_relative "../Canvas"
require_relative "../Utils"
require_relative "../BitmapEditor"

describe BitmapEditor do

  describe "#new_canvas" do
    context "before intiailising the new canvas" do
      it "should give an error when trying to print the canvas" do
        bitmap = BitmapEditor.new(nil)
        message = bitmap.process("S")
        expect(message).to eq "You haven't created an canvas yet"
      end
    end
  end

end