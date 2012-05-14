require 'spec_helper'

describe Forgery::Storage do
  let(:storage) { Forgery::Storage.new(:dictionaries) }

  it "should check if the file is loaded" do
    storage[:colors]

    storage.should be_loaded(:colors)
  end

  it "should load a file when called by the key" do
    storage.should_not be_loaded(:colors)

    storage[:colors]

    storage.should be_loaded(:colors)
  end

  it "should clear the loaded files when calling reset!" do
    storage[:colors]

    storage.should be_loaded(:colors)

    storage.reset!

    storage.should_not be_loaded(:colors)
  end
end
