require 'spec_helper'

describe Forgery::Currency do
  describe ".currency_descriptions" do
    it "should be able to generate a currency description" do
      Forgery::Currency.description.should_not eql(nil)
    end
  end

  describe ".currency_codes" do
    it "should have the same output when encrypting twice" do
      Forgery::Currency.code.should_not eql(nil)
    end
  end
end
