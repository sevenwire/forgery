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
  
  it "should create a dictionary file from xml content" do
    Forgery::FileWriter.stub!(:open_document).and_return(sample_xml)
    dictionary = Forgery::FileWriter.create_dictionary('dogs', 'http://www.stubbedmethod.com', 'dog')
    puts dictionary
    File.exist?(File.expand_path(dictionary)).should be_true
    IO.readlines(dictionary)[0].chomp.should == 'Golden Retriever'
    IO.readlines(dictionary)[2].chomp.should == 'Labrador Retriever'
  end
  
  def sample_xml
    xml = <<-EOXML
    <?xml version="1.0" encoding="UTF-8"?>
    <dogs>
    	<dog>Golden Retriever</dog>
    	<dog>Beagle</dog>
    	<dog>Labrador Retriever</dog>
    </dogs>
    EOXML
    Nokogiri::XML(xml)
  end
  
  after :each do
    File.delete @file if File.exist? @file
  end
end