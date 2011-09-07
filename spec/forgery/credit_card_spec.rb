require 'spec_helper'

describe Forgery::CreditCard do
  describe ".number" do
    # basics
    it "should be valid (pass a Luhn test)" do
      valid_number?(Forgery::CreditCard.number).should eql(true)
    end

    it "should start with a valid prefix" do
      which_type?(Forgery::CreditCard.number).should_not eql(false)
    end

    # type specified
    it "should be valid if type specified" do
      valid_number?(Forgery::CreditCard.number :type => 'Discover').should eql(true)
    end

    it "should start with a valid prefix for type specified" do
      which_type?(Forgery::CreditCard.number :type => 'MasterCard').should eql(:master)
    end

    # type and length specified
    it "should be valid if type and length specified" do
      valid_number?(Forgery::CreditCard.number :type => 'Visa', :length => 13).should eql(true)
    end

    it "should be the length specified" do
      (Forgery::CreditCard.number :type => 'Visa', :length => 13).length.should eql(13)
    end

    # length and prefixes specified
    it "should be valid if length and prefixes specified" do
      valid_number?(Forgery::CreditCard.number :length => 14, :prefixes => %w"300 301 302 303 36 38").should eql(true)
    end

    it "should be a valid Diners Club card, since its length and prefixes are specified" do
      which_type?(Forgery::CreditCard.number :length => 14, :prefixes => %w"300 301 302 303 36 38").should eql(:diners)
    end
  end

  describe ".type" do
    it "should return a valid type" do
      which_type?(Forgery::CreditCard.number :type => Forgery::CreditCard.type).should_not eql(false)
    end
  end

  # helper functions below originally from: https://gist.github.com/1182499
  def valid_number?(number)
    number.reverse!
    relative_number = {'0' => 0, '1' => 2, '2' => 4, '3' => 6, '4' => 8, '5' => 1, '6' => 3, '7' => 5, '8' => 7, '9' => 9}
    sum = 0
    number.split("").each_with_index do |n, i|
      sum += (i % 2 == 0) ? n.to_i : relative_number[n]
    end
    sum % 10 == 0
  end

  def which_type?(number)
    return :diners   if number.length == 14 && number =~ /^3(0[0-5]|[68])/   # 300xxx-305xxx, 36xxxx, 38xxxx
    return :amex     if number.length == 15 && number =~ /^3[47]/            # 34xxxx, 37xxxx
    return :visa     if [13,16].include?(number.length) && number =~ /^4/    # 4xxxxx
    return :master   if number.length == 16 && number =~ /^5[1-5]/           # 51xxxx-55xxxx
    return :discover if number.length == 16 && number =~ /^6011/             # 6011xx
    return false
  end

end
