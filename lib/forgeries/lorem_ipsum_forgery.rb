class LoremIpsumForgery < Forgery
  dictionaries :lorem_ipsum

  def self.text(what=:sentence, quantity=2, options={})
    case what
    when :character
      self.character(options)
    when :characters
      self.characters(quantity, options)
    when :word
      self.word(options)
    when :words
      self.words(quantity, options)
    when :sentence
      self.sentence(options)
    when :sentences
      self.sentences(quantity, options)
    when :paragraph
      self.paragraph(options)
    when :paragraphs
      self.paragraphs(quantity, options)
    end
  end


  def self.character(options={})
    self.characters(1, options)
  end

  def self.characters(quantity=10, options={})
    characters = LOREM_IPSUM.join("").downcase.gsub(/[^a-z\s]/,'')

    options = { :random_limit => characters.length-quantity }.merge(options) if quantity.class == Fixnum

    characters[range_from_quantity(quantity, options)]
  end

  def self.word(options={})
    self.words(1, options)
  end

  def self.words(quantity=10, options={})
    words = LOREM_IPSUM.join(" ").downcase.gsub(/\.|,|;/, '').split(" ")

    options = { :random_limit => words.length-quantity }.merge(options) if quantity.class == Fixnum

    words[range_from_quantity(quantity, options)].join(" ")
  end

  def self.sentence(options={})
    self.sentences(1, options)
  end

  def self.sentences(quantity=2, options={})
    options = { :random_limit => (LOREM_IPSUM.length-quantity) }.merge(options) if quantity.class == Fixnum

    LOREM_IPSUM[range_from_quantity(quantity, options)].join(" ")
  end

  def self.paragraph(options={})
    options = { :wrap => { :start => "", :end => "" } }.merge(options)

    self.paragraphs(1, options)
  end

  def self.paragraphs(quantity=2, options={})
    options = {:separator => "\n",
               :wrap => {
                 :start => "<p>",
                 :end => "</p>" },
               :sentences => 3}.merge!(options)
    options = { :random_limit => (LOREM_IPSUM.length/options[:sentences])-quantity }.merge(options) if quantity.class == Fixnum

    range = range_from_quantity(quantity, options)
    start = range.first * options[:sentences]

    paragraphs = []

    range.to_a.length.times do |i|
      paragraphs << (
        options[:wrap][:start] +
        LOREM_IPSUM[start..(start+options[:sentences]-1)].join(" ") +
        options[:wrap][:end]
      )
      start += options[:sentences]
    end

    paragraphs.join(options[:separator])
  end


protected

  def self.range_from_quantity(quantity, options={})
    return quantity if quantity.class == Range

    if options[:random]
      start = (0..options[:random_limit]).random
      start..(start+quantity-1)
    else
      0..(quantity-1)
    end
  end
  
end
