require 'spec_helper'

describe Forgery::FileReader do
  describe ".read_file_from_folder" do
    it "should return an array of file contents lines" do
      Forgery::FileReader.read_file_from_folder(:colors, :dictionaries).should be_is_a(Array)
    end

    it "should read from overriden load path" do
      Forgery.load_from! "spec/data"
      Forgery::FileReader.read_file_from_folder(:female_first_names, :dictionaries).should == %w(Amber)
    end

    it "should raise an exception if file wasn't found in load paths" do
      lambda {
        Forgery::FileReader.read_file_from_folder(:non_existing_dictionary, :dictionaries)
      }.should raise_error(ArgumentError)
    end
  end
  
  after do
    # reset load_paths
    Forgery.load_paths.clear
    Forgery.load_paths << File.expand_path("lib/forgery")
  end
end
