require File.dirname(__FILE__) + '/../spec_helper'

describe Range do
  it "should get a random number out of the range" do
    range = (0..9)
    10.times { range.should include(range.random) }
  end

  it "should get a random string our of the range" do
    range = ("a".."z")
    10.times { range.should include(range.random) }
  end

  it "should return nil if the maximum is less than the minimum" do
    ("z".."a").random.should be_nil
  end
end
