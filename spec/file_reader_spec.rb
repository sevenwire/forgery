require 'spec_helper'

describe Forgery::FileReader do
  let(:file_reader) { Forgery::FileReader.new('dictionaries') }

  describe "#read_file" do
    it "should return an array of file contents lines" do
      file_reader.read_file(:colors).should be_is_a(Array)
    end

    it "should read from overriden load path" do
      Forgery.load_from! "spec/data"
      file_reader.read_file(:female_first_names).should == %w(Amber)
    end

    it "should raise an exception if file wasn't found in load paths" do
      lambda {
        file_reader.read_file(:non_existing_dictionary)
      }.should raise_error(ArgumentError)
    end
  end
  
  after do
    # reset load_paths
    Forgery.load_paths.clear
    Forgery.load_paths << File.expand_path("lib/forgery")
  end
end
