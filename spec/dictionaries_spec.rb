require 'spec_helper'

describe Forgery::Dictionaries do
  it "should check if the dictionary is loaded" do
    dictionaries = Forgery::Dictionaries.new

    dictionaries[:colors]

    expect(dictionaries).to be_loaded(:colors)
  end

  it "should load a dictionary when called by the key" do
    dictionaries = Forgery::Dictionaries.new

    dictionaries.reset!

    expect(dictionaries).not_to be_loaded(:colors)

    dictionaries[:colors]

    expect(dictionaries).to be_loaded(:colors)
  end

  it "should clear the loaded dictionaries when calling reset!" do
    dictionaries = Forgery::Dictionaries.new

    dictionaries[:colors]

    expect(dictionaries).to be_loaded(:colors)

    dictionaries.reset!

    expect(dictionaries).not_to be_loaded(:colors)
  end
end
