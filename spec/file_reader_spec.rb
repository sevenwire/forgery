require File.dirname(__FILE__) + '/spec_helper'

describe Forgery::FileReader do
  it "should return an array when calling read_dictionary" do
    Forgery::FileReader.read_dictionary(:colors).should be_is_a(Array)
  end

  it "should return an array when calling read_format" do
    Forgery::FileReader.read_format(:phone).should be_is_a(Array)
  end
  
  it "should override default dictionaries if Forgery#load_from! was called" do
    Forgery.load_from! "spec/data"
    Forgery::FileReader.read_dictionary(:female_first_names).should == %w(Amber)    
  end
  
  it "should read dictionaries from custom places if Forgery#load_from! was called" do  
    Forgery.load_from! "spec/data"
    Forgery::FileReader.read_dictionary(:code_names).should include('Shiretoko')
  end
  
  after do
    # reset load_paths
    Forgery.load_paths.clear
    Forgery.load_paths << File.expand_path("lib/forgery")
  end
end
