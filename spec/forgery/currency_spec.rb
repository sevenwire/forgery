require 'spec_helper'

describe Forgery::Currency do
  describe ".currency_descriptions" do
    it "should be able to generate a currency description" do
      expect(Forgery::Currency.description).not_to eql(nil)
    end
  end

  describe ".currency_codes" do
    it "should have the same output when encrypting twice" do
      expect(Forgery::Currency.code).not_to eql(nil)
    end
  end
end
