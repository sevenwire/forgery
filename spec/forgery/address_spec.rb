require 'spec_helper'

describe Forgery::Address do
  it "should return a random street" do
    Forgery::Tool.dictionaries[:streets].should include(Forgery::Address.street_name)
  end

  it "should return a random street number" do
    original_format = Forgery::Address.street_number.gsub(/\d/, '#')
    Forgery::Tool.formats[:street_number].should include(original_format)
  end

  it "should return a random street suffix" do
    Forgery::Tool.dictionaries[:street_suffixes].should include(Forgery::Address.street_suffix)
  end

  describe ".street_address" do
    before do
      @split_address = Forgery::Address.street_address.split
    end

    it "should return a random street suffix" do
      street_suffix = @split_address.pop
      Forgery::Tool.dictionaries[:street_suffixes].should include(street_suffix)
    end

    it "should return a random street number" do
      street_number_format = @split_address.shift.gsub(/\d/, '#')
      Forgery::Tool.formats[:street_number].should include(street_number_format)
    end

    it "should return a random street" do
      @split_address.pop
      @split_address.shift
      street = @split_address.join(" ")
      Forgery::Tool.dictionaries[:streets].should include(street)
    end
  end

  it "should return a random city" do
    city = Forgery::Address.city
    Forgery::Tool.dictionaries[:cities].should include(city)
  end

  it "should return a random state" do
    state = Forgery::Address.state
    Forgery::Tool.dictionaries[:states].should include(state)
  end

  it "should return a random state abbreviation" do
    state_abbrev = Forgery::Address.state_abbrev
    Forgery::Tool.dictionaries[:state_abbrevs].should include(state_abbrev)
  end

  it "should return a random Canadian province or territory" do
    province = Forgery::Address.province
    Forgery::Tool.dictionaries[:provinces].should include(province)
  end

  it "should return a random Canadian province or territory abbreviation" do
    province_abbrev = Forgery::Address.province_abbrev
    Forgery::Tool.dictionaries[:province_abbrevs].should include(province_abbrev)
  end

  it "should return a random country" do
    country = Forgery::Address.country
    Forgery::Tool.dictionaries[:countries].should include(country)
  end

  it "should return a random continent" do
    continent = Forgery::Address.continent
    Forgery::Tool.dictionaries[:continents].should include(continent)
  end

  it "should return a random zip code" do
    zip_format = Forgery::Address.zip.gsub(/\d/, '#')
    Forgery::Tool.formats[:zip].should include(zip_format)
  end

  it "should return a random phone number" do
    phone_format = Forgery::Address.phone.gsub(/\d/, '#')
    Forgery::Tool.formats[:phone].should include(phone_format)
  end
end
