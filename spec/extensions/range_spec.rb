require 'spec_helper'
require 'timeout'

describe Range do
  it "should get a random number out of the range" do
    range = Forgery::Extend(0..9)
    10.times { range.should include(range.random) }
  end

  it "should not take a long time when the range is huge" do
    Timeout.timeout(1){Forgery::Extend(1234567890..12345678901234567890).random}.should_not raise_error(Timeout::Error)
  end

  it "should return nil for a random number from a reverse range" do
    10.times { Forgery::Extend(9..0).random.should be_nil }
  end

  it "should get a random string our of the range" do
    range = Forgery::Extend("a".."z")
    10.times { range.should include(range.random) }
  end

  it "should return nil if the maximum is less than the minimum" do
    Forgery::Extend("z".."a").random.should be_nil
  end

  it "should not return the maximum at excluded range" do
    Kernel.should_receive(:rand).with(9).and_return(8)
    Forgery::Extend(0...9).random.should_not be_equal 9
  end
end
