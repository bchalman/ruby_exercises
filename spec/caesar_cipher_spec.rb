require './caesar_cipher.rb'

describe '#caesar_cipher' do
  context "when a string is given" do
    it "Shifts one-word string right" do
      expect(caesar_cipher("hello", 3)).to eq("khoor")
    end

    it "shifts one-word string left" do
      expect(caesar_cipher("Hello", -2)).to eq("Fcjjm")
    end

    it "shifts multiple words" do
      expect(caesar_cipher("Hello world", 3)).to eq("Khoor zruog")
    end

    it "leaves punctuation and case intact" do
      expect(caesar_cipher("Hi!", 3)).to eq("Kl!")
    end

    it "leaves numbers intact" do
      expect(caesar_cipher("abc123", 2)).to eq("cde123")
    end

    it "wraps around the end of the alphabet" do
      expect(caesar_cipher("yz", 2)).to eq("ab")
    end
  end
end
