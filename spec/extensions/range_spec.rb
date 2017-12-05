require 'spec_helper'
require 'timeout'

describe Range do
  it 'should get a random number out of the range' do
    range = Forgery::Extend(0..9)
    10.times { expect(range).to include(range.random) }
  end

  it 'should not take a long time when the range is huge' do
    expect do
      Timeout.timeout(1) { Forgery::Extend(1_234_567_890..12_345_678_901_234_567_890).random }
    end.not_to raise_error
  end

  it 'should return nil for a random number from a reverse range' do
    10.times { expect(Forgery::Extend(9..0).random).to be_nil }
  end

  it 'should get a random string our of the range' do
    range = Forgery::Extend('a'..'z')
    10.times { expect(range).to include(range.random) }
  end

  it 'should return nil if the maximum is less than the minimum' do
    expect(Forgery::Extend('z'..'a').random).to be_nil
  end

  it 'should not return the maximum at excluded range' do
    expect(Random).to receive(:rand).with(0...9).and_return(8)
    expect(Forgery::Extend(0...9).random).to_not eq(9)
  end
end
