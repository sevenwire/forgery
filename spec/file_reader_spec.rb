require 'spec_helper'

describe Forgery::FileReader do
  it "should return an array when calling read_dictionary" do
    expect(Forgery::FileReader.read_dictionary(:colors)).to be_is_a(Array)
  end

  it "should return an array when calling read_format" do
    expect(Forgery::FileReader.read_format(:phone)).to be_is_a(Array)
  end

  it "should override default dictionaries if Forgery#load_from! was called" do
    Forgery.load_from! "spec/data"
    expect(Forgery::FileReader.read_dictionary(:female_first_names)).to eq(%w(Amber))
  end

  it "should read dictionaries from custom places if Forgery#load_from! was called" do
    Forgery.load_from! "spec/data"
    expect(Forgery::FileReader.read_dictionary(:code_names)).to include('Shiretoko')
  end

  it "should raise an exception if file wasn't found in load paths" do
    expect {
      Forgery::FileReader.read_dictionary(:non_existing_dictionary)
    }.to raise_error(ArgumentError)
  end
  after do
    # reset load_paths
    Forgery.load_paths.clear
    Forgery.load_paths << File.expand_path("lib/forgery")
  end
end
