require 'spec_helper'

describe Array do
  before do
    @array = Forgery::Extend([0,1,2,3,4,5,6,7,8,9])
  end

  it "should get a random item out of the array" do
    10.times { expect(@array).to include(@array.random) }
  end

  it "should return nil if the array is empty" do
    expect(Forgery::Extend([]).random).to be_nil
  end

  it "should return a random subset of the array" do
    @array.random_subset(5).each do |i|
      expect(@array).to include(i)
    end
  end

  it "should return a random subset of the array that is 3 long" do
    expect(@array.random_subset(3).size).to eq(3)
  end
end
