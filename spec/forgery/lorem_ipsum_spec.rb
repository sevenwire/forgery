require 'spec_helper'

describe Forgery::LoremIpsum do
  describe ".paragraphs" do
    it "should return text" do
      expect(Forgery::LoremIpsum.paragraphs).to be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      expect(Forgery::LoremIpsum.paragraphs.size).to be >= 1
    end

    it "should default to returning 2 paragraphs separated by \\n\\n" do
      expect(Forgery::LoremIpsum.paragraphs.split("\n\n").size).to eq(2)
    end

    it "should default to returning 3 sentences per paragraph" do
      paragraphs = Forgery::LoremIpsum.paragraphs.split("\n\n")
      paragraphs.each do |paragraph|
        expect(paragraph.scan(".").size).to eq(3)
      end
    end

    it "should wrap paragraphs in html paragraph tags when the :html option is true" do
      paragraphs = Forgery::LoremIpsum.paragraphs(2, :html => true).split("\n\n")
      paragraphs.each do |paragraph|
        expect(paragraph).to match(/<p>.+?<\/p>/)
      end
    end

    it "should wrap paragraphs in specified wrapping text" do
      paragraphs = Forgery::LoremIpsum.paragraphs(2, :wrap => {:start => "foo", :end => "bar"}).split("\n\n")
      paragraphs.each do |paragraph|
        expect(paragraph).to match(/foo.+bar/)
      end
    end

    it "should separate paragraphs with the specified string" do
      expect(Forgery::LoremIpsum.paragraphs(2, :separator => "foo").split("foo").size).to eq(2)
    end
  end

  describe ".paragraph" do
    it "should return text" do
      expect(Forgery::LoremIpsum.paragraph).to be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      expect(Forgery::LoremIpsum.paragraph.size).to be >= 1
    end

    it "should return a single paragraph" do
      expect(Forgery::LoremIpsum.paragraph.scan("\n\n").size).to eq(0)
    end
  end

  describe ".sentences" do
    it "should return text" do
      expect(Forgery::LoremIpsum.sentences).to be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      expect(Forgery::LoremIpsum.sentences.size).to be >= 1
    end

    it "should return two sentences by default" do
      expect(Forgery::LoremIpsum.sentences.scan(".").size).to eq(2)
    end

    it "should return as many sentences as you specify" do
      expect(Forgery::LoremIpsum.sentences(4).scan(".").size).to eq(4)
    end
  end

  describe ".sentence" do
    it "should return text" do
      expect(Forgery::LoremIpsum.sentence).to be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      expect(Forgery::LoremIpsum.sentence.size).to be >= 1
    end

    it "should return a single sentence" do
      expect(Forgery::LoremIpsum.sentence.scan(".").size).to eq(1)
    end
  end

  describe ".words" do
    it "should return text" do
      expect(Forgery::LoremIpsum.words).to be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      expect(Forgery::LoremIpsum.words.size).to be >= 1
    end

    it "should return a random set of words" do
      Forgery::LoremIpsum.words(2, :random => true)
    end
  end

  describe ".word" do
    it "should return text" do
      expect(Forgery::LoremIpsum.word).to be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      expect(Forgery::LoremIpsum.word.size).to be >= 1
    end
  end

  describe ".characters" do
    it "should return text" do
      expect(Forgery::LoremIpsum.characters).to be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      expect(Forgery::LoremIpsum.characters.size).to be >= 1
    end
  end

  describe ".character" do
    it "should return text" do
      expect(Forgery::LoremIpsum.character).to be_a_kind_of(String)
    end

    it "should return text with 1 or more character" do
      expect(Forgery::LoremIpsum.character.size).to be >= 1
    end
  end
end