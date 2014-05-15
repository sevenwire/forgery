require 'spec_helper'
require 'pathname'

describe Forgery do
  it "should load a dictionary when it is requested" do
    Forgery.dictionaries.reset!

    expect(Forgery.dictionaries).not_to be_loaded(:colors)

    Forgery.dictionaries[:colors]

    expect(Forgery.dictionaries).to be_loaded(:colors)
  end

  it "should load formats when it is requested" do
    Forgery.formats.reset!

    expect(Forgery.formats).not_to be_loaded(:phone)

    Forgery.formats[:phone]

    expect(Forgery.formats).to be_loaded(:phone)
  end

  it "should accept a symbol and return the appropriate forgery class" do
    expect(Forgery(:address)).to eq(Forgery::Address)
    expect(Forgery(:basic)).to eq(Forgery::Basic)
    expect(Forgery(:internet)).to eq(Forgery::Internet)
  end

  it "should accept two symbols, finding the right class and calling the appropriate method" do
    expect(Forgery::Address).to receive(:street_name)
    Forgery(:address, :street_name)

    expect(Forgery::Name).to receive(:full_name)
    Forgery(:name, :full_name)
  end

  it "should accept two symbols and arguments, passing them along to the appropriate method" do
    expect(Forgery::LoremIpsum).to receive(:text).with(:sentences, 2)
    Forgery(:lorem_ipsum, :text, :sentences, 2)
  end

  it "should return the rails root path as a string if Rails.root is defined" do
    Rails = Object.new
    allow(Rails).to receive(:root).and_return(Pathname.new('/path/from/rails/dot/root'))
    expect(Forgery.rails_root).to eq('/path/from/rails/dot/root')
    Object.instance_eval { remove_const(:Rails) }
  end

  it "should return nil when Rails.root and Rails.root are not defined" do
    expect(Forgery.rails_root).to be_nil
  end

  it "should not be a rails environment when there is not a rails_root" do
    expect(Forgery.rails?).to be_false
  end

  it "should be a rails environment when there is a rails_root" do
    allow(Forgery).to receive(:rails?).and_return(true)
    expect(Forgery.rails?).to be_true
  end
end
