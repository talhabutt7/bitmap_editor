require_relative "../IOManager"
require_relative "../Commands"
require_relative "../Image"
require_relative "../Utils"
require_relative "../BitmapEditor"

describe BitmapEditor do

  describe "#new_image" do
    context "before intiailising the new image" do
      it "should give an error when trying to print the image" do
        bitmap = BitmapEditor.new(nil)
        message = bitmap.process("S")
        expect(message).to eq "You haven't created an image yet"
      end
    end
  end

end