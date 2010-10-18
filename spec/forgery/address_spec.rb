require 'spec_helper'

describe Forgery::Address do
  it "should return a random street" do
    Forgery.dictionaries[:streets].should include(Forgery::Address.street_name)
  end

  it "should return a random street number" do
    original_format = Forgery::Address.street_number.gsub(/\d/, '#')
    Forgery.formats[:street_number].should include(original_format)
  end

  it "should return a random street suffix" do
    Forgery.dictionaries[:street_suffixes].should include(Forgery::Address.street_suffix)
  end

  describe ".street_address" do
    before do
      @split_address = Forgery::Address.street_address.split
    end

    it "should return a random street suffix" do
      street_suffix = @split_address.pop
      Forgery.dictionaries[:street_suffixes].should include(street_suffix)
    end

    it "should return a random street number" do
      street_number_format = @split_address.shift.gsub(/\d/, '#')
      Forgery.formats[:street_number].should include(street_number_format)
    end

    it "should return a random street" do
      @split_address.pop
      @split_address.shift
      street = @split_address.join(" ")
      Forgery.dictionaries[:streets].should include(street)
    end
  end

  it "should return a random city" do
    city = Forgery::Address.city
    Forgery.dictionaries[:cities].should include(city)
  end

  it "should return a random state" do
    state = Forgery::Address.state
    Forgery.dictionaries[:states].should include(state)
  end

  it "should return a random state abbreviation" do
    state_abbrev = Forgery::Address.state_abbrev
    Forgery.dictionaries[:state_abbrevs].should include(state_abbrev)
  end

  it "should return a random Canadian province or territory" do
    province = Forgery::Address.province
    Forgery.dictionaries[:provinces].should include(province)
  end

  it "should return a random Canadian province or territory abbreviation" do
    province_abbrev = Forgery::Address.province_abbrev
    Forgery.dictionaries[:province_abbrevs].should include(province_abbrev)
  end

  it "should return a random country" do
    country = Forgery::Address.country
    Forgery.dictionaries[:countries].should include(country)
  end

  it "should return a random continent" do
    continent = Forgery::Address.continent
    Forgery.dictionaries[:continents].should include(continent)
  end

  it "should return a random zip code" do
    zip_format = Forgery::Address.zip.gsub(/\d/, '#')
    Forgery.formats[:zip].should include(zip_format)
  end

  it "should return a random phone number" do
    phone_format = Forgery::Address.phone.gsub(/\d/, '#')
    Forgery.formats[:phone].should include(phone_format)
  end
end
