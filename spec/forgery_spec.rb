require File.dirname(__FILE__) + '/spec_helper'

describe Forgery do
  it "should define constants for defined dictionaries" do
    Forgery.dictionaries :cities, :colors, :countries
    Forgery::CITIES.should be_is_a(Array)
    Forgery::COLORS.should be_is_a(Array)
    Forgery::COUNTRIES.should be_is_a(Array)
  end

  it "should define constants for defined formats" do
    Forgery.formats :phone, :street_number, :zip
    Forgery::PHONE_FORMATS.should be_is_a(Array)
    Forgery::STREET_NUMBER_FORMATS.should be_is_a(Array)
    Forgery::ZIP_FORMATS.should be_is_a(Array)
  end

  it "should accept a symbol and return the appropriate forgery class" do
    Forgery(:address).should == AddressForgery
    Forgery(:basic).should == BasicForgery
    Forgery(:internet).should == InternetForgery
  end

  it "should accept two symbols, finding the right class and calling the appropriate method" do
    AddressForgery.should_receive(:street_name)
    Forgery(:address, :street_name)

    NameForgery.should_receive(:full_name)
    Forgery(:name, :full_name)
  end

  it "should accept two symbols and arguments, passing them along to the appropriate method" do
    LoremIpsumForgery.should_receive(:text).with(:sentences, 2)
    Forgery(:lorem_ipsum, :text, :sentences, 2)
  end
end
