require 'spec_helper'

describe Forgery::Storage do
  let(:file_reader) { stub(Forgery::FileReader) }
  let(:storage) { Forgery::Storage.new(file_reader) }

  it "should check if the file is loaded" do
    file_reader.stub(:read_file).with(:colors).and_return([])
    storage[:colors]

    storage.should be_loaded(:colors)
  end

  it "should load a file when called by the key" do
    file_reader.should_receive(:read_file).with(:colors).and_return([])
    storage.should_not be_loaded(:colors)

    storage[:colors]

    storage.should be_loaded(:colors)
  end

  it "should clear the loaded files when calling reset!" do
    file_reader.stub(:read_file).with(:colors).and_return([])
    storage[:colors]

    storage.should be_loaded(:colors)

    storage.reset!

    storage.should_not be_loaded(:colors)
  end
end
