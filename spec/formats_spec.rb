require File.dirname(__FILE__) + '/spec_helper'

describe Formats do
  it "should check if the dictionary is loaded" do
    formats = Formats.new

    formats[:phone]

    formats.should be_loaded(:phone)
  end

  it "should load a dictionary when called by the key" do
    formats = Formats.new

    formats.reset!

    formats.should_not be_loaded(:phone)

    formats[:phone]

    formats.should be_loaded(:phone)
  end

  it "should clear the loaded formats when calling reset!" do
    formats = Formats.new

    formats[:phone]

    formats.should be_loaded(:phone)

    formats.reset!

    formats.should_not be_loaded(:phone)
  end
end
