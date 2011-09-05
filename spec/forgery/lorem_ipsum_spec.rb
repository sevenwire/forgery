require 'spec_helper'

describe Forgery::LoremIpsum do
  describe ".paragraphs" do
    it "should return text" do
      Forgery::LoremIpsum.paragraphs.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      Forgery::LoremIpsum.paragraphs.size.should >= 1
    end

    it "should default to returning 2 paragraphs separated by \\n\\n" do
      Forgery::LoremIpsum.paragraphs.split("\n\n").size.should == 2
    end

    it "should default to returning 3 sentences per paragraph" do
      paragraphs = Forgery::LoremIpsum.paragraphs.split("\n\n")
      paragraphs.each do |paragraph|
        paragraph.scan(".").size.should == 3
      end
    end

    it "should wrap paragraphs in html paragraph tags when the :html option is true" do
      paragraphs = Forgery::LoremIpsum.paragraphs(2, :html => true).split("\n\n")
      paragraphs.each do |paragraph|
        paragraph.should match(/<p>.+?<\/p>/)
      end
    end

    it "should wrap paragraphs in specified wrapping text" do
      paragraphs = Forgery::LoremIpsum.paragraphs(2, :wrap => {:start => "foo", :end => "bar"}).split("\n\n")
      paragraphs.each do |paragraph|
        paragraph.should match(/foo.+bar/)
      end
    end

    it "should separate paragraphs with the specified string" do
      Forgery::LoremIpsum.paragraphs(2, :separator => "foo").split("foo").size.should == 2
    end
  end

  describe ".paragraph" do
    it "should return text" do
      Forgery::LoremIpsum.paragraph.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      Forgery::LoremIpsum.paragraph.size.should >= 1
    end

    it "should return a single paragraph" do
      Forgery::LoremIpsum.paragraph.scan("\n\n").size.should == 0
    end
  end

  describe ".sentences" do
    it "should return text" do
      Forgery::LoremIpsum.sentences.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      Forgery::LoremIpsum.sentences.size.should >= 1
    end

    it "should return two sentences by default" do
      Forgery::LoremIpsum.sentences.scan(".").size.should == 2
    end

    it "should return as many sentences as you specify" do
      Forgery::LoremIpsum.sentences(4).scan(".").size.should == 4
    end
  end

  describe ".sentence" do
    it "should return text" do
      Forgery::LoremIpsum.sentence.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      Forgery::LoremIpsum.sentence.size.should >= 1
    end

    it "should return a single sentence" do
      Forgery::LoremIpsum.sentence.scan(".").size.should == 1
    end
  end

  describe ".words" do
    it "should return text" do
      Forgery::LoremIpsum.words.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      Forgery::LoremIpsum.words.size.should >= 1
    end

    it "should return a random set of words" do
      Forgery::LoremIpsum.words(2, :random => true)
    end
  end

  describe ".word" do
    it "should return text" do
      Forgery::LoremIpsum.word.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      Forgery::LoremIpsum.word.size.should >= 1
    end
  end

  describe ".characters" do
    it "should return text" do
      Forgery::LoremIpsum.characters.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      Forgery::LoremIpsum.characters.size.should >= 1
    end
  end

  describe ".character" do
    it "should return text" do
      Forgery::LoremIpsum.character.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      Forgery::LoremIpsum.character.size.should >= 1
    end
  end
end