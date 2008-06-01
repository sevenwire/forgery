require File.dirname(__FILE__) + '/../spec_helper'

describe AddressForgery do
  it "should return a random street" do
    AddressForgery::STREETS.should include(AddressForgery.street_name)
  end

  it "should return a random street number" do
    original_format = AddressForgery.street_number.gsub(/\d/, '#')
    AddressForgery::STREET_NUMBER_FORMATS.should include(original_format)
  end

  it "should return a random street suffix" do
    AddressForgery::STREET_SUFFIXES.should include(AddressForgery.street_suffix)
  end

  describe ".street_address" do
    before do
      @split_address = AddressForgery.street_address.split
    end

    it "should return a random street suffix" do
      street_suffix = @split_address.pop
      AddressForgery::STREET_SUFFIXES.should include(street_suffix)
    end

    it "should return a random street number" do
      street_number_format = @split_address.shift.gsub(/\d/, '#')
      AddressForgery::STREET_NUMBER_FORMATS.should include(street_number_format)
    end

    it "should return a random street" do
      @split_address.pop
      @split_address.shift
      street = @split_address.join(" ")
      AddressForgery::STREETS.should include(street)
    end
  end

  it "should return a random city" do
    city = AddressForgery.city
    AddressForgery::CITIES.should include(city)
  end

  it "should return a random state" do
    state = AddressForgery.state
    AddressForgery::STATES.should include(state)
  end

  it "should return a random state abbreviation" do
    state_abbrev = AddressForgery.state_abbrev
    AddressForgery::STATE_ABBREVS.should include(state_abbrev)
  end

  it "should return a random country" do
    country = AddressForgery.country
    AddressForgery::COUNTRIES.should include(country)
  end

  it "should return a random zip code" do
    zip_format = AddressForgery.zip.gsub(/\d/, '#')
    AddressForgery::ZIP_FORMATS.should include(zip_format)
  end

  it "should return a random phone number" do
    phone_format = AddressForgery.phone.gsub(/\d/, '#')
    AddressForgery::PHONE_FORMATS.should include(phone_format)
  end
end
