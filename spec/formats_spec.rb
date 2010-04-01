require 'spec_helper'

describe Forgery::Formats do
  it "should check if the dictionary is loaded" do
    formats = Forgery::Formats.new

    formats[:phone]

    formats.should be_loaded(:phone)
  end

  it "should load a dictionary when called by the key" do
    formats = Forgery::Formats.new

    formats.reset!

    formats.should_not be_loaded(:phone)

    formats[:phone]

    formats.should be_loaded(:phone)
  end

  it "should clear the loaded formats when calling reset!" do
    formats = Forgery::Formats.new

    formats[:phone]

    formats.should be_loaded(:phone)

    formats.reset!

    formats.should_not be_loaded(:phone)
  end
end
