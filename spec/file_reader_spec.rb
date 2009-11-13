require File.dirname(__FILE__) + '/spec_helper'

describe Forgery::FileReader do
  it "should return an array when calling read_dictionary" do
    Forgery::FileReader.read_dictionary(:colors).should be_is_a(Array)
  end

  it "should return an array when calling read_format" do
    Forgery::FileReader.read_format(:phone).should be_is_a(Array)
  end
end
