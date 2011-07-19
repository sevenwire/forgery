require 'spec_helper'
require 'pathname'

describe Forgery do
  it "should load a dictionary when it is requested" do
    Forgery.dictionaries.reset!

    Forgery.dictionaries.should_not be_loaded(:colors)

    Forgery.dictionaries[:colors]

    Forgery.dictionaries.should be_loaded(:colors)
  end

  it "should load formats when it is requested" do
    Forgery.formats.reset!

    Forgery.formats.should_not be_loaded(:phone)

    Forgery.formats[:phone]

    Forgery.formats.should be_loaded(:phone)
  end

  it "should accept a symbol and return the appropriate forgery class" do
    Forgery(:address).should == Forgery::Address
    Forgery(:basic).should == Forgery::Basic
    Forgery(:internet).should == Forgery::Internet
  end

  it "should accept two symbols, finding the right class and calling the appropriate method" do
    Forgery::Address.should_receive(:street_name)
    Forgery(:address, :street_name)

    Forgery::Name.should_receive(:full_name)
    Forgery(:name, :full_name)
  end

  it "should accept two symbols and arguments, passing them along to the appropriate method" do
    Forgery::LoremIpsum.should_receive(:text).with(:sentences, 2)
    Forgery(:lorem_ipsum, :text, :sentences, 2)
  end

  it "should return the rails root path as a string if Rails.root is defined" do
    Rails = Object.new
    Rails.stub!(:root).and_return(Pathname.new('/path/from/rails/dot/root'))
    Forgery.rails_root.should == '/path/from/rails/dot/root'
    Object.instance_eval { remove_const(:Rails) }
  end

  it "should return nil when Rails.root and Rails.root are not defined" do
    Forgery.rails_root.should be_nil
  end

  it "should not be a rails environment when there is not a rails_root" do
    Forgery.rails?.should be_false
  end

  it "should be a rails environment when there is a rails_root" do
    Forgery.stub!(:rails?).and_return(true)
    Forgery.rails?.should be_true
  end
end
