require File.dirname(__FILE__) + '/../spec_helper'

describe BasicForgery do
  describe ".password" do
    it "should only uppercase characters" do
      BasicForgery.password(:allow_lower => false,
                            :allow_upper => true,
                            :allow_numeric => false,
                            :allow_special => false).should only_contain(BasicForgery::UPPER_ALPHA)
    end

    it "should only contain lowercase characters" do
      BasicForgery.password(:allow_lower => true,
                            :allow_upper => false,
                            :allow_numeric => false,
                            :allow_special => false).should only_contain(BasicForgery::LOWER_ALPHA)
    end

    it "should only contain numeric characters" do
      BasicForgery.password(:allow_lower => false,
                            :allow_upper => false,
                            :allow_numeric => true,
                            :allow_special => false).should only_contain(BasicForgery::NUMERIC)
    end

    it "should only contain special characters" do
      BasicForgery.password(:allow_lower => false,
                            :allow_upper => false,
                            :allow_numeric => false,
                            :allow_special => true).should only_contain(BasicForgery::SPECIAL_CHARACTERS)
    end

    it "should only contain lower and uppercase characters" do
      BasicForgery.password(:allow_lower => true,
                            :allow_upper => true,
                            :allow_numeric => false,
                            :allow_special => false).should only_contain(BasicForgery::LOWER_ALPHA,
                                                                         BasicForgery::UPPER_ALPHA)
    end

    it "should only contain numeric and special characters" do
      BasicForgery.password(:allow_lower => false,
                            :allow_upper => false,
                            :allow_numeric => true,
                            :allow_special => true).should only_contain(BasicForgery::NUMERIC,
                                                                        BasicForgery::SPECIAL_CHARACTERS)
    end

    it "should contain any of the defined characters" do
      BasicForgery.password(:allow_lower => true,
                            :allow_upper => true,
                            :allow_numeric => true,
                            :allow_special => true).should only_contain(BasicForgery::NUMERIC,
                                                                        BasicForgery::SPECIAL_CHARACTERS,
                                                                        BasicForgery::LOWER_ALPHA,
                                                                        BasicForgery::UPPER_ALPHA)
    end
  end

  describe ".encrypt" do
    it "should encrypt to hex digits" do
      BasicForgery.encrypt("something").should only_contain(BasicForgery::HEX_DIGITS)
    end

    it "should encrypt different words to different output" do
      BasicForgery.encrypt("foo").should_not == BasicForgery.encrypt("bar")
    end

    it "should allow a salt that changes the output" do
      BasicForgery.encrypt("foo", "baz").should_not == BasicForgery.encrypt("foo", "bar")
    end

    it "should have the same output when encrypting twice" do
      BasicForgery.encrypt("foo", "bar").should == BasicForgery.encrypt("foo", "bar")
    end
  end

  describe ".boolean" do
    it "should return true or false" do
      [true, false].should include(BasicForgery.boolean)
    end
  end

  describe ".color" do
    it "should return a random color" do
      Forgery.dictionaries[:colors].should include(BasicForgery.color)
    end
  end

  describe ".hex_color" do
    it "should return a 6-character hex color" do
      BasicForgery.hex_color.should match(/#(#{BasicForgery::HEX_DIGITS.join('|')}){6}/)
    end
  end

  describe ".short_hex_color" do
    it "should return a 3-character hex color" do
      BasicForgery.short_hex_color.should match(/#(#{BasicForgery::HEX_DIGITS.join('|')}){3}/)
    end
  end

  describe ".number" do
    it "should return a number >= the at_least option" do
      BasicForgery.number(:at_least => 2).should >= 2
    end

    it "should return a number <= the at_most option" do
      BasicForgery.number(:at_most => 12).should <= 12
    end
  end

  describe ".text" do
    it "should return text whose length is >= the at_least option" do
      BasicForgery.text(:at_least => 5).size.should >= 5
    end

    it "should return text whose length is <= the at_most option" do
      BasicForgery.text(:at_least => 15).size.should <= 15
    end

    it "should only uppercase characters" do
      BasicForgery.text(:allow_lower => false,
                        :allow_upper => true,
                        :allow_numeric => false,
                        :allow_special => false).should only_contain(BasicForgery::UPPER_ALPHA)
    end

    it "should only contain lowercase characters" do
      BasicForgery.text(:allow_lower => true,
                        :allow_upper => false,
                        :allow_numeric => false,
                        :allow_special => false).should only_contain(BasicForgery::LOWER_ALPHA)
    end

    it "should only contain numeric characters" do
      BasicForgery.text(:allow_lower => false,
                        :allow_upper => false,
                        :allow_numeric => true,
                        :allow_special => false).should only_contain(BasicForgery::NUMERIC)
    end

    it "should only contain special characters" do
      BasicForgery.text(:allow_lower => false,
                        :allow_upper => false,
                        :allow_numeric => false,
                        :allow_special => true).should only_contain(BasicForgery::SPECIAL_CHARACTERS)
    end

    it "should only contain lower and uppercase characters" do
      BasicForgery.text(:allow_lower => true,
                        :allow_upper => true,
                        :allow_numeric => false,
                        :allow_special => false).should only_contain(BasicForgery::LOWER_ALPHA,
                                                                     BasicForgery::UPPER_ALPHA)
    end

    it "should only contain numeric and special characters" do
      BasicForgery.text(:allow_lower => false,
                        :allow_upper => false,
                        :allow_numeric => true,
                        :allow_special => true).should only_contain(BasicForgery::NUMERIC,
                                                                    BasicForgery::SPECIAL_CHARACTERS)
    end

    it "should contain any of the defined characters" do
      BasicForgery.text(:allow_lower => true,
                        :allow_upper => true,
                        :allow_numeric => true,
                        :allow_special => true).should only_contain(BasicForgery::NUMERIC,
                                                                    BasicForgery::SPECIAL_CHARACTERS,
                                                                    BasicForgery::LOWER_ALPHA,
                                                                    BasicForgery::UPPER_ALPHA)
    end
  end
end
