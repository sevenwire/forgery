require File.dirname(__FILE__) + '/../spec_helper'

describe Forgery::Internet do
  describe ".user_name" do
    it "should return a username that is lowercase" do
      Forgery::Internet.user_name.should only_contain(Forgery::Basic::LOWER_ALPHA)
    end
  end

  it "should return a top level domain" do
    Forgery.dictionaries[:top_level_domains].should include(Forgery::Internet.top_level_domain)
  end

  describe ".domain_name" do
    it "should return a domain name that contains a lowercase company name" do
      downcase_company_name = Forgery::Internet.domain_name.split('.').first
      Forgery.dictionaries[:company_names].any?{ |cn| cn =~ /#{downcase_company_name}/i }
    end

    it "should return a domain name that contains a top level domain" do
      Forgery.dictionaries[:top_level_domains].should include(Forgery::Internet.domain_name.split('.').last)
    end
  end

  describe ".email_address" do
    it "should match the email format" do
      Forgery::Internet.email_address.should match(/.+@.+\.(#{Forgery.dictionaries[:top_level_domains].join("|")})/)
    end
  end
end