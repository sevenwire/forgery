require 'spec_helper'

describe Forgery::Dictionaries do
  it "should check if the dictionary is loaded" do
    dictionaries = Forgery::Dictionaries.new

    dictionaries[:colors]

    dictionaries.should be_loaded(:colors)
  end

  it "should load a dictionary when called by the key" do
    dictionaries = Forgery::Dictionaries.new

    dictionaries.reset!

    dictionaries.should_not be_loaded(:colors)

    dictionaries[:colors]

    dictionaries.should be_loaded(:colors)
  end

  it "should clear the loaded dictionaries when calling reset!" do
    dictionaries = Forgery::Dictionaries.new

    dictionaries[:colors]

    dictionaries.should be_loaded(:colors)

    dictionaries.reset!

    dictionaries.should_not be_loaded(:colors)
  end
end
