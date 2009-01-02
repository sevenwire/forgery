require File.dirname(__FILE__) + '/../spec_helper'
require 'timeout'

describe Range do
  it "should get a random number out of the range" do
    range = (0..9)
    10.times { range.should include(range.random) }
  end

  it "should not take a long time when the range is huge" do
    Timeout.timeout(1){(1234567890..12345678901234567890).random}.should_not raise_error(Timeout::Error)
  end

  it "should return nil for a random number from a reverse range" do
    10.times { (9..0).random.should be_nil }
  end

  it "should get a random string our of the range" do
    range = ("a".."z")
    10.times { range.should include(range.random) }
  end

  it "should return nil if the maximum is less than the minimum" do
    ("z".."a").random.should be_nil
  end
end
