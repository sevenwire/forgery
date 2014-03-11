require 'spec_helper'

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

  describe ".cctld" do
    it "should return a country-code top level domain" do
      Forgery.dictionaries[:country_code_top_level_domains].should include(Forgery::Internet.cctld)
    end

    it "should return the cctld in correct two-letter format" do
      Forgery::Internet.cctld.should =~ /\A[a-z]{2}\Z/
    end
  end

  describe '.ip_v4' do
    it 'should be 4 integers between 0 and 255 seprated by "."' do
      val = Forgery::Internet.ip_v4
      nums = val.split('.')
      nums.should have(4).items
      nums.each do |num|
        num.should =~ /\d{1,3}/
        num.to_i.should <= 255
        num.to_i.should >= 0
      end
    end
  end

  describe '.ip_v6' do
    it 'should be a valid ipv6 address' do
      val = Forgery::Internet.ip_v6
      address = IPAddr.new(val)
      address.ipv6?.should eq(true)
    end
  end

end
