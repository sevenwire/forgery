require File.dirname(__FILE__) + '/spec_helper'

describe Dictionaries do
  it "should check if the dictionary is loaded" do
    dictionaries = Dictionaries.new

    dictionaries[:colors]

    dictionaries.should be_loaded(:colors)
  end

  it "should load a dictionary when called by the key" do
    dictionaries = Dictionaries.new

    dictionaries.reset!

    dictionaries.should_not be_loaded(:colors)

    dictionaries[:colors]

    dictionaries.should be_loaded(:colors)
  end

  it "should clear the loaded dictionaries when calling reset!" do
    dictionaries = Dictionaries.new

    dictionaries[:colors]

    dictionaries.should be_loaded(:colors)

    dictionaries.reset!

    dictionaries.should_not be_loaded(:colors)
  end
end
