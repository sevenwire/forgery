require 'spec_helper'
require 'bigdecimal'

describe Forgery::Monetary do

  it "should return random number string" do
    Forgery(:monetary).money.should match(/^[\d+\.]+$/)
  end

  it "should return random number respecting min and max parameters" do
    BigDecimal.new(Forgery(:monetary).money({:min => 10, :max => 20})).should be_between(10, 20)
  end

end
