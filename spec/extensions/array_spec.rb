require File.dirname(__FILE__) + '/../spec_helper'

describe Array do
  before do
    @array = [0,1,2,3,4,5,6,7,8,9]
  end

  it "should get a random item out of the array" do
    10.times { @array.should include(@array.random) }
  end

  it "should return nil if the array is empty" do
    [].random.should be_nil
  end
end
