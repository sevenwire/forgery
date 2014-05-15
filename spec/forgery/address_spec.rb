require 'spec_helper'

describe Forgery::Address do
  it "should return a random street" do
    expect(Forgery.dictionaries[:streets]).to include(Forgery::Address.street_name)
  end

  it "should return a random street number" do
    original_format = Forgery::Address.street_number.gsub(/\d/, '#')
    expect(Forgery.formats[:street_number]).to include(original_format)
  end

  it "should return a random street suffix" do
    expect(Forgery.dictionaries[:street_suffixes]).to include(Forgery::Address.street_suffix)
  end

  describe ".street_address" do
    before do
      @split_address = Forgery::Address.street_address.split
    end

    it "should return a random street suffix" do
      street_suffix = @split_address.pop
      expect(Forgery.dictionaries[:street_suffixes]).to include(street_suffix)
    end

    it "should return a random street number" do
      street_number_format = @split_address.shift.gsub(/\d/, '#')
      expect(Forgery.formats[:street_number]).to include(street_number_format)
    end

    it "should return a random street" do
      @split_address.pop
      @split_address.shift
      street = @split_address.join(" ")
      expect(Forgery.dictionaries[:streets]).to include(street)
    end
  end

  it "should return a random city" do
    city = Forgery::Address.city
    expect(Forgery.dictionaries[:cities]).to include(city)
  end

  it "should return a random state" do
    state = Forgery::Address.state
    expect(Forgery.dictionaries[:states]).to include(state)
  end

  it "should return a random state abbreviation" do
    state_abbrev = Forgery::Address.state_abbrev
    expect(Forgery.dictionaries[:state_abbrevs]).to include(state_abbrev)
  end

  it "should return a random Canadian province or territory" do
    province = Forgery::Address.province
    expect(Forgery.dictionaries[:provinces]).to include(province)
  end

  it "should return a random Canadian province or territory abbreviation" do
    province_abbrev = Forgery::Address.province_abbrev
    expect(Forgery.dictionaries[:province_abbrevs]).to include(province_abbrev)
  end

  it "should return a random country" do
    country = Forgery::Address.country
    expect(Forgery.dictionaries[:countries]).to include(country)
  end

  it "should return a random continent" do
    continent = Forgery::Address.continent
    expect(Forgery.dictionaries[:continents]).to include(continent)
  end

  it "should return a random zip code" do
    zip_format = Forgery::Address.zip.gsub(/\d/, '#')
    expect(Forgery.formats[:zip]).to include(zip_format)
  end

  it "should return a random phone number" do
    phone_format = Forgery::Address.phone.gsub(/\d/, '#')
    expect(Forgery.formats[:phone]).to include(phone_format)
  end
end
