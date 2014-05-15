require 'spec_helper'

describe Forgery::Basic do
  describe ".password" do
    it "should only uppercase characters" do
      expect(Forgery::Basic.password(:allow_lower => false,
                            :allow_upper => true,
                            :allow_numeric => false,
                            :allow_special => false)).to only_contain(Forgery::Basic::UPPER_ALPHA)
    end

    it "should only contain lowercase characters" do
      expect(Forgery::Basic.password(:allow_lower => true,
                            :allow_upper => false,
                            :allow_numeric => false,
                            :allow_special => false)).to only_contain(Forgery::Basic::LOWER_ALPHA)
    end

    it "should only contain numeric characters" do
      expect(Forgery::Basic.password(:allow_lower => false,
                            :allow_upper => false,
                            :allow_numeric => true,
                            :allow_special => false)).to only_contain(Forgery::Basic::NUMERIC)
    end

    it "should only contain special characters" do
      expect(Forgery::Basic.password(:allow_lower => false,
                            :allow_upper => false,
                            :allow_numeric => false,
                            :allow_special => true)).to only_contain(Forgery::Basic::SPECIAL_CHARACTERS)
    end

    it "should only contain lower and uppercase characters" do
      expect(Forgery::Basic.password(:allow_lower => true,
                            :allow_upper => true,
                            :allow_numeric => false,
                            :allow_special => false)).to only_contain(Forgery::Basic::LOWER_ALPHA,
                                                                         Forgery::Basic::UPPER_ALPHA)
    end

    it "should only contain numeric and special characters" do
      expect(Forgery::Basic.password(:allow_lower => false,
                            :allow_upper => false,
                            :allow_numeric => true,
                            :allow_special => true)).to only_contain(Forgery::Basic::NUMERIC,
                                                                        Forgery::Basic::SPECIAL_CHARACTERS)
    end

    it "should contain any of the defined characters" do
      expect(Forgery::Basic.password(:allow_lower => true,
                            :allow_upper => true,
                            :allow_numeric => true,
                            :allow_special => true)).to only_contain(Forgery::Basic::NUMERIC,
                                                                        Forgery::Basic::SPECIAL_CHARACTERS,
                                                                        Forgery::Basic::LOWER_ALPHA,
                                                                        Forgery::Basic::UPPER_ALPHA)
    end
  end

  describe ".encrypt" do
    it "should encrypt to hex digits" do
      expect(Forgery::Basic.encrypt("something")).to only_contain(Forgery::Basic::HEX_DIGITS)
    end

    it "should encrypt different words to different output" do
      expect(Forgery::Basic.encrypt("foo")).not_to eq(Forgery::Basic.encrypt("bar"))
    end

    it "should allow a salt that changes the output" do
      expect(Forgery::Basic.encrypt("foo", "baz")).not_to eq(Forgery::Basic.encrypt("foo", "bar"))
    end

    it "should have the same output when encrypting twice" do
      expect(Forgery::Basic.encrypt("foo", "bar")).to eq(Forgery::Basic.encrypt("foo", "bar"))
    end
  end

  describe ".boolean" do
    it "should return true or false" do
      expect([true, false]).to include(Forgery::Basic.boolean)
    end
  end

  describe ".color" do
    it "should return a random color" do
      expect(Forgery.dictionaries[:colors]).to include(Forgery::Basic.color)
    end
  end

  describe ".hex_color" do
    it "should return a 6-character hex color" do
      expect(Forgery::Basic.hex_color).to match(/#(#{Forgery::Basic::HEX_DIGITS.join('|')}){6}/)
    end
  end

  describe ".short_hex_color" do
    it "should return a 3-character hex color" do
      expect(Forgery::Basic.short_hex_color).to match(/#(#{Forgery::Basic::HEX_DIGITS.join('|')}){3}/)
    end
  end

  describe ".number" do
    it "should return a number >= the at_least option" do
      expect(Forgery::Basic.number(:at_least => 2)).to be >= 2
    end

    it "should return a number <= the at_most option" do
      expect(Forgery::Basic.number(:at_most => 12)).to be <= 12
    end
  end

  describe ".text" do
    it "should return text whose length is >= the at_least option" do
      expect(Forgery::Basic.text(:at_least => 5).size).to be >= 5
    end

    it "should return text whose length is <= the at_most option" do
      expect(Forgery::Basic.text(:at_most => 15).size).to be <= 15
    end
    
    it "should return text whose length is == the exactly option" do
      expect(Forgery::Basic.text(:exactly => 20).size).to eq(20)
    end

    it "should only uppercase characters" do
      expect(Forgery::Basic.text(:allow_lower => false,
                        :allow_upper => true,
                        :allow_numeric => false,
                        :allow_special => false)).to only_contain(Forgery::Basic::UPPER_ALPHA)
    end

    it "should only contain lowercase characters" do
      expect(Forgery::Basic.text(:allow_lower => true,
                        :allow_upper => false,
                        :allow_numeric => false,
                        :allow_special => false)).to only_contain(Forgery::Basic::LOWER_ALPHA)
    end

    it "should only contain numeric characters" do
      expect(Forgery::Basic.text(:allow_lower => false,
                        :allow_upper => false,
                        :allow_numeric => true,
                        :allow_special => false)).to only_contain(Forgery::Basic::NUMERIC)
    end

    it "should only contain special characters" do
      expect(Forgery::Basic.text(:allow_lower => false,
                        :allow_upper => false,
                        :allow_numeric => false,
                        :allow_special => true)).to only_contain(Forgery::Basic::SPECIAL_CHARACTERS)
    end

    it "should only contain lower and uppercase characters" do
      expect(Forgery::Basic.text(:allow_lower => true,
                        :allow_upper => true,
                        :allow_numeric => false,
                        :allow_special => false)).to only_contain(Forgery::Basic::LOWER_ALPHA,
                                                                     Forgery::Basic::UPPER_ALPHA)
    end

    it "should only contain numeric and special characters" do
      expect(Forgery::Basic.text(:allow_lower => false,
                        :allow_upper => false,
                        :allow_numeric => true,
                        :allow_special => true)).to only_contain(Forgery::Basic::NUMERIC,
                                                                    Forgery::Basic::SPECIAL_CHARACTERS)
    end

    it "should contain any of the defined characters" do
      expect(Forgery::Basic.text(:allow_lower => true,
                        :allow_upper => true,
                        :allow_numeric => true,
                        :allow_special => true)).to only_contain(Forgery::Basic::NUMERIC,
                                                                    Forgery::Basic::SPECIAL_CHARACTERS,
                                                                    Forgery::Basic::LOWER_ALPHA,
                                                                    Forgery::Basic::UPPER_ALPHA)
    end
  end
end
