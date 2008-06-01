require File.dirname(__FILE__) + '/../spec_helper'

describe BasicForgery do
  describe "#password" do
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
end