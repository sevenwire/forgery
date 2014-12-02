require 'spec_helper'
require 'timeout'

describe Range do
  it "should get a random number out of the range" do
    range = Forgery::Extend(0..9)
    10.times { expect(range).to include(range.random) }
  end

  it "should not take a long time when the range is huge" do
    expect {
      Timeout.timeout(1){Forgery::Extend(1234567890..12345678901234567890).random}
    }.not_to raise_error
  end

  it "should return nil for a random number from a reverse range" do
    10.times { expect(Forgery::Extend(9..0).random).to be_nil }
  end

  it "should get a random string our of the range" do
    range = Forgery::Extend("a".."z")
    10.times { expect(range).to include(range.random) }
  end

  it "should return nil if the maximum is less than the minimum" do
    expect(Forgery::Extend("z".."a").random).to be_nil
  end

  it "should not return the maximum at excluded range" do
    expect(Kernel).to receive(:rand).with(9).and_return(8)
    expect(Forgery::Extend(0...9).random).not_to be_equal 9
  end
end
