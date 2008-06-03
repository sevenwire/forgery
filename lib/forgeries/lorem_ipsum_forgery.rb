class LoremIpsumForgery < Forgery
  dictionaries :lorem_ipsum
  LOREM_IPSUM_WORDS = LOREM_IPSUM.join(" ").downcase.gsub(/\.|,|;/, '').split(" ")
  LOREM_IPSUM_CHARACTERS = LOREM_IPSUM.join("").downcase.gsub(/[^a-z\s]/,'')

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
    options.merge!(:random_limit => LOREM_IPSUM_CHARACTERS.length-quantity) if quantity.is_a?(Fixnum)

    LOREM_IPSUM_CHARACTERS[range_from_quantity(quantity, options)]
  end

  def self.word(options={})
    self.words(1, options)
  end

  def self.words(quantity=10, options={})
    options.merge!(:random_limit => LOREM_IPSUM_WORDS.length-quantity) if quantity.is_a?(Fixnum)

    LOREM_IPSUM_WORDS[range_from_quantity(quantity, options)].join(" ")
  end

  def self.sentence(options={})
    self.sentences(1, options)
  end

  def self.sentences(quantity=2, options={})
    options.merge!(:random_limit => (LOREM_IPSUM.length-quantity)) if quantity.is_a?(Fixnum)

    LOREM_IPSUM[range_from_quantity(quantity, options)].join(" ")
  end

  def self.paragraph(options={})
    self.paragraphs(1, options)
  end

  def self.paragraphs(quantity=2, options={})
    options.reverse_merge!(:separator => "\n\n",
                           :wrap => {
                             :start => "",
                             :end => "" },
                           :html => false,
                           :sentences => 3)
    options.merge!(:random_limit => (LOREM_IPSUM.length/options[:sentences])-quantity) if quantity.is_a?(Fixnum)

    if options[:html]
      options[:wrap] = { :start => "<p>",
                         :end => "</p>" }
    end

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
    return quantity if quantity.is_a?(Range)

    if options[:random]
      start = (0..options[:random_limit]).random
      start..(start+quantity-1)
    else
      0..(quantity-1)
    end
  end
  
end
