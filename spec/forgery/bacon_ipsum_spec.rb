require 'spec_helper'

describe Forgery::BaconIpsum do
  describe ".paragraphs" do
    it "should return text" do
      Forgery::BaconIpsum.paragraphs.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      Forgery::BaconIpsum.paragraphs.size.should >= 1
    end

    it "should default to returning 2 paragraphs separated by \\n\\n" do
      Forgery::BaconIpsum.paragraphs.split("\n\n").size.should == 2
    end

    it "should default to returning 3 sentences per paragraph" do
      paragraphs = Forgery::BaconIpsum.paragraphs.split("\n\n")
      paragraphs.each do |paragraph|
        paragraph.scan(".").size.should == 3
      end
    end

    it "should wrap paragraphs in html paragraph tags when the :html option is true" do
      paragraphs = Forgery::BaconIpsum.paragraphs(2, :html => true).split("\n\n")
      paragraphs.each do |paragraph|
        paragraph.should match(/<p>.+?<\/p>/)
      end
    end

    it "should wrap paragraphs in specified wrapping text" do
      paragraphs = Forgery::BaconIpsum.paragraphs(2, :wrap => {:start => "foo", :end => "bar"}).split("\n\n")
      paragraphs.each do |paragraph|
        paragraph.should match(/foo.+bar/)
      end
    end

    it "should separate paragraphs with the specified string" do
      Forgery::BaconIpsum.paragraphs(2, :separator => "foo").split("foo").size.should == 2
    end
  end

  describe ".paragraph" do
    it "should return text" do
      Forgery::BaconIpsum.paragraph.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      Forgery::BaconIpsum.paragraph.size.should >= 1
    end

    it "should return a single paragraph" do
      Forgery::BaconIpsum.paragraph.scan("\n\n").size.should == 0
    end
  end

  describe ".sentences" do
    it "should return text" do
      Forgery::BaconIpsum.sentences.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      Forgery::BaconIpsum.sentences.size.should >= 1
    end

    it "should return two sentences by default" do
      Forgery::BaconIpsum.sentences.scan(".").size.should == 2
    end

    it "should return as many sentences as you specify" do
      Forgery::BaconIpsum.sentences(4).scan(".").size.should == 4
    end
  end

  describe ".sentence" do
    it "should return text" do
      Forgery::BaconIpsum.sentence.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      Forgery::BaconIpsum.sentence.size.should >= 1
    end

    it "should return a single sentence" do
      Forgery::BaconIpsum.sentence.scan(".").size.should == 1
    end
  end

  describe ".words" do
    it "should return text" do
      Forgery::BaconIpsum.words.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      Forgery::BaconIpsum.words.size.should >= 1
    end
  end

  describe ".word" do
    it "should return text" do
      Forgery::BaconIpsum.word.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      Forgery::BaconIpsum.word.size.should >= 1
    end
  end

  describe ".characters" do
    it "should return text" do
      Forgery::BaconIpsum.characters.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      Forgery::BaconIpsum.characters.size.should >= 1
    end
  end

  describe ".character" do
    it "should return text" do
      Forgery::BaconIpsum.character.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      Forgery::BaconIpsum.character.size.should >= 1
    end
  end
end