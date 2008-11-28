require File.dirname(__FILE__) + '/spec_helper'

describe Forgery do
  it "should load a dictionary when it is requested" do
    Forgery.dictionaries.reset!

    Forgery.dictionaries.should_not be_loaded(:colors)

    Forgery.dictionaries[:colors]

    Forgery.dictionaries.should be_loaded(:colors)
  end

  it "should load formats when it is requested" do
    Forgery.formats.reset!

    Forgery.formats.should_not be_loaded(:phone)

    Forgery.formats[:phone]

    Forgery.formats.should be_loaded(:phone)
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
