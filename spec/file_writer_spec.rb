require 'spec_helper'

describe Forgery::FileWriter do
  before :each do
    Forgery::FileWriter.write_to! 'spec/data/dictionaries'
    @lines = ['one', 'two', 'three']
    @file = Forgery::FileWriter.create_file('test_file', @lines)    
  end
  
  it "should create a dictionary file when given an array" do
    File.exist?(File.expand_path(@file)).should be_true
  end
  
  it "should have one line for each item in the array" do
    IO.readlines(@file)[0].chomp.should == "one"
    IO.readlines(@file)[2].chomp.should == "three"
  end
  
  after :each do
    File.delete @file if File.exist? @file
  end
  
end