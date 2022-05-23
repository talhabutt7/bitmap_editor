require_relative "../IOManager"
require_relative "../Commands"
require_relative "../Canvas"
require_relative "../Utils"
require_relative "../BitmapEditor"

describe Utils do

  describe "#is_uppercase_char" do
    
    context "try number" do
      it "should return false" do
        expect(Utils.is_uppercase_char("8HJ")).to be_falsey
        expect(Utils.is_uppercase_char("100")).to be_falsey
        expect(Utils.is_uppercase_char("65")).to be_falsey
        expect(Utils.is_uppercase_char("3.87")).to be_falsey
      end
    end

    context "try lowercase letter" do
      it "should return false" do
        expect(Utils.is_uppercase_char("g")).to be_falsey
        expect(Utils.is_uppercase_char("a")).to be_falsey
        expect(Utils.is_uppercase_char("z")).to be_falsey
        expect(Utils.is_uppercase_char("jh4ghs")).to be_falsey
      end
    end

    context "try uppercase letter" do
      it "should return true" do
        expect(Utils.is_uppercase_char("A")).to be_truthy
        expect(Utils.is_uppercase_char("Z")).to be_truthy
        expect(Utils.is_uppercase_char("N")).to be_truthy
        expect(Utils.is_uppercase_char("Q")).to be_truthy
      end
    end

    context "try special character" do
      it "should return false" do
        expect(Utils.is_uppercase_char(".=")).to be_falsey
        expect(Utils.is_uppercase_char("+[]")).to be_falsey
        expect(Utils.is_uppercase_char("/hj")).to be_falsey
        expect(Utils.is_uppercase_char(":SA")).to be_falsey
      end
    end

    context "try mixture of characters" do
      it "should return false" do
        expect(Utils.is_uppercase_char("8j4f")).to be_falsey
        expect(Utils.is_uppercase_char("Gmb3F")).to be_falsey
        expect(Utils.is_uppercase_char("zdD3g")).to be_falsey
        expect(Utils.is_uppercase_char("SSSSS")).to be_falsey
      end
    end

  end

  describe "#is_numeric" do
    
    context "empty list" do
      it "should return false" do
        expect(Utils.is_numeric([])).to be false
      end
    end

    context "list of numeric strings" do
      it "should return true" do
        expect(Utils.is_numeric(["4", "6", "2", "8", "999"])).to be true
      end
    end

    context "list of numbers" do
      it "should return true" do
        expect(Utils.is_numeric([4, 6, 2, 8, 999])).to be true
        expect(Utils.is_numeric([41, 6.5, 23, 811])).to be true
      end
    end

    context "mixture of numbers and words" do
      it "should return false" do
        expect(Utils.is_numeric(["9k", "l9k", "ma", "77"])).to be false
      end
    end

  end

end