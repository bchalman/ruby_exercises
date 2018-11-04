require './my_enumerable_methods.rb'

describe Enumerable do
  let(:array){[1,2,3,4,5]}

  describe '#my_each' do
    it "yields each element to a block" do
      expect{|b| array.my_each(&b)}.to yield_successive_args(1,2,3,4,5)
    end
    it "returns itself" do
      expect(array.my_each{|i| i+1}).to eql(array)
    end
  end

  describe '#my_select' do
    it "returns an array with selected elements" do
      expect(array.my_select{|i| i>3}).to eq([4,5])
    end
    it "returns an empty array if no elements match" do
      expect(array.my_select{|i| false}.empty?).to be true
    end
  end

  describe '#my_all?' do
    it "returns true if all elements match the condition" do
      expect(array.my_all?{|i| i > 0}).to be true
    end
    it "returns false if at least one element does not match" do
      expect(array.my_all?{|i| i > 1}).to be false
    end
  end

  describe '#my_count' do

    context "when no arguments are given" do
      it "returns the total number of items in the array" do
        expect(array.my_count).to eq(5)
      end
    end

    context "when one argument is given" do
      it "returns the number of times the argument is in the array" do
        expect(array.my_count(2)).to eq(1)
      end
    end

    context "when a blcok is given" do
      it "accepts a block" do
        expect{|b| array.my_count(&b)}.to yield_successive_args(1,2,3,4,5)
      end
      it "returns the number of items that meet the block condition" do
        expect(array.my_count{|i| i > 2}).to eq(3)
      end
    end
  end

  describe '#my_map' do
    it "accepts a block" do
      expect{|b| array.my_map(&b)}.to yield_successive_args(1,2,3,4,5)
    end
    it "returns new array of mapped elements" do
      expect(array.my_map{|i| i * 3}).to eq([3,6,9,12,15])
    end

    it "accepts a proc" do
      times_two = Proc.new {|i| i * 2}
      expect(array.my_map(times_two)).to eq([2,4,6,8,10])
    end
  end

  describe '#my_inject' do
    it "sums the items of an array" do
      expect(array.my_inject{|tot, i| tot + i}).to eq (15)
    end
    it "accepts a default value" do
      expect(array.my_inject(10){|tot, i| tot + i}).to eq (25)
    end
    it "works for array length of 1" do
      expect([7].my_inject{|tot, i| tot + i}).to eq (7)
    end
  end
end
