require File.dirname(__FILE__) + '/spec_helper'

describe FileReader do
  it "should return an array when calling read_dictionary" do
    FileReader.read_dictionary(:colors).should be_is_a(Array)
  end

  it "should return an array when calling read_format" do
    FileReader.read_format(:phone).should be_is_a(Array)
  end
end
