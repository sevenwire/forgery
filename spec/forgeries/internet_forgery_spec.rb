require File.dirname(__FILE__) + '/../spec_helper'

describe InternetForgery do
  describe ".user_name" do
    it "should return a username that is lowercase" do
      InternetForgery.user_name.should only_contain(BasicForgery::LOWER_ALPHA)
    end
  end

  it "should return a top level domain" do
    Forgery.dictionaries[:top_level_domains].should include(InternetForgery.top_level_domain)
  end

  describe ".domain_name" do
    it "should return a domain name that contains a lowercase company name" do
      downcase_company_name = InternetForgery.domain_name.split('.').first
      Forgery.dictionaries[:company_names].any?{ |cn| cn =~ /#{downcase_company_name}/i }
    end

    it "should return a domain name that contains a top level domain" do
      Forgery.dictionaries[:top_level_domains].should include(InternetForgery.domain_name.split('.').last)
    end
  end

  describe ".email_address" do
    it "should match the email format" do
      InternetForgery.email_address.should match(/.+@.+\.(#{Forgery.dictionaries[:top_level_domains].join("|")})/)
    end
  end
  
  describe '.ip_v4' do
    it 'should be 4 integers between 0 and 255 seprated by "."' do
      val = InternetForgery.ip_v4
      nums = val.split('.')
      nums.should have(4).items
      nums.each do |num|
        num.should =~ /\d{1,3}/
        num.to_i.should <= 255
        num.to_i.should >= 0 
      end
    end
  end
end