require 'spec_helper'
require 'bigdecimal'

describe Forgery::Monetary do

  it "should return random number string" do
    expect(Forgery(:monetary).money).to match(/^[\d+\.]+$/)
  end

  it "should return random number respecting min and max parameters" do
    expect(BigDecimal.new(Forgery(:monetary).money({:min => 10, :max => 20}))).to be_between(10, 20)
  end

end
