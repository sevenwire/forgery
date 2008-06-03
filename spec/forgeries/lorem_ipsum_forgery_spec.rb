require File.dirname(__FILE__) + '/../spec_helper'

describe LoremIpsumForgery do
  describe ".paragraphs" do
    it "should return text" do
      LoremIpsumForgery.paragraphs.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      LoremIpsumForgery.paragraphs.size.should >= 1
    end

    it "should default to returning 2 paragraphs separated by \\n\\n" do
      LoremIpsumForgery.paragraphs.split("\n\n").size.should == 2
    end

    it "should default to returning 3 sentences per paragraph" do
      paragraphs = LoremIpsumForgery.paragraphs.split("\n\n")
      paragraphs.each do |paragraph|
        paragraph.scan(".").size.should == 3
      end
    end

    it "should wrap paragraphs in html paragraph tags when the :html option is true" do
      paragraphs = LoremIpsumForgery.paragraphs(2, :html => true).split("\n\n")
      paragraphs.each do |paragraph|
        paragraph.should match(/<p>.+?<\/p>/)
      end
    end

    it "should wrap paragraphs in specified wrapping text" do
      paragraphs = LoremIpsumForgery.paragraphs(2, :wrap => {:start => "foo", :end => "bar"}).split("\n\n")
      paragraphs.each do |paragraph|
        paragraph.should match(/foo.+bar/)
      end
    end

    it "should separate paragraphs with the specified string" do
      LoremIpsumForgery.paragraphs(2, :separator => "foo").split("foo").size.should == 2
    end
  end

  describe ".paragraph" do
    it "should return text" do
      LoremIpsumForgery.paragraph.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      LoremIpsumForgery.paragraph.size.should >= 1
    end

    it "should return a single paragraph" do
      LoremIpsumForgery.paragraph.scan("\n\n").size.should == 0
    end
  end

  describe ".sentences" do
    it "should return text" do
      LoremIpsumForgery.sentences.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      LoremIpsumForgery.sentences.size.should >= 1
    end

    it "should return two sentences by default" do
      LoremIpsumForgery.sentences.scan(".").size.should == 2
    end

    it "should return as many sentences as you specify" do
      LoremIpsumForgery.sentences(4).scan(".").size.should == 4
    end
  end

  describe ".sentence" do
    it "should return text" do
      LoremIpsumForgery.sentence.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      LoremIpsumForgery.sentence.size.should >= 1
    end

    it "should return a single sentence" do
      LoremIpsumForgery.sentence.scan(".").size.should == 1
    end
  end

  describe ".words" do
    it "should return text" do
      LoremIpsumForgery.words.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      LoremIpsumForgery.words.size.should >= 1
    end
  end

  describe ".word" do
    it "should return text" do
      LoremIpsumForgery.word.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      LoremIpsumForgery.word.size.should >= 1
    end
  end

  describe ".characters" do
    it "should return text" do
      LoremIpsumForgery.characters.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      LoremIpsumForgery.characters.size.should >= 1
    end
  end

  describe ".character" do
    it "should return text" do
      LoremIpsumForgery.character.should be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      LoremIpsumForgery.character.size.should >= 1
    end
  end
end