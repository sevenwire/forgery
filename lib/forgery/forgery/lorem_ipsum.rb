class Forgery::LoremIpsum < Forgery

  def self.text(what=:sentence, quantity=2, options={})
    case what
    when :character
      character(options)
    when :characters
      characters(quantity, options)
    when :word
      word(options)
    when :words
      words(quantity, options)
    when :sentence
      sentence(options)
    when :sentences
      sentences(quantity, options)
    when :paragraph
      paragraph(options)
    when :paragraphs
      paragraphs(quantity, options)
    when :title
      title(options)
    end
  end

  def self.character(options={})
    characters(1, options)
  end

  def self.characters(quantity=10, options={})
    options.merge!(:random_limit => lorem_ipsum_characters.length-quantity) if quantity.is_a?(Fixnum)

    lorem_ipsum_characters[range_from_quantity(quantity, options)]
  end

  def self.word(options={})
    words(1, options)
  end

  def self.words(quantity=10, options={})
    options.merge!(:random_limit => lorem_ipsum_words.length-quantity) if quantity.is_a?(Fixnum)

    lorem_ipsum_words[range_from_quantity(quantity, options)].join(" ")
  end

  def self.sentence(options={})
    sentences(1, options)
  end

  def self.sentences(quantity=2, options={})
    options.merge!(:random_limit => (dictionaries[:lorem_ipsum].length-quantity)) if quantity.is_a?(Fixnum)

    dictionaries[:lorem_ipsum][range_from_quantity(quantity, options)].join(" ")
  end

  # Yields paragraphs to the given block. If no block is given,
  # returns an Enumerator.
  #
  # Honors the :sentences option.
  #
  # @yield paragraph
  def self.each_paragraph(start_at = 0, options = {})
    default_options = {:sentences => 3}
    options = default_options.merge(options)

    start = start_at * options[:sentences]

    next_paragraph = lambda {
      paragraph = dictionaries[:lorem_ipsum][start..(start+options[:sentences]-1)].join(" ")
      start += options[:sentences]
      paragraph
    }
    enumer = Enumerator.new { |yielder|
      loop do
        yielder.yield next_paragraph.call
      end
    }

    if block_given?
      then enumer.each do |par| yield par end
      else enumer
    end
  end

  def self.paragraph(options={})
    paragraphs(1, options)
  end

  def self.paragraphs(quantity=2, options={})
    default_options = {:separator => "\n\n",
                           :wrap => {
                             :start => "",
                             :end => "" },
                           :html => false,
                           :sentences => 3}
    options = default_options.merge(options)
    options.merge!(:random_limit => (dictionaries[:lorem_ipsum].length/options[:sentences])-quantity) if quantity.is_a?(Fixnum)

    if options[:html]
      options[:wrap] = { :start => "<p>",
                         :end => "</p>" }
    end

    range = range_from_quantity(quantity, options)
    start_at = range.first

    paragraphs =
      each_paragraph(start_at, options).
      take(range.count).
      map { |par| options[:wrap][:start] + par + options[:wrap][:end] }

    return paragraphs.join(options[:separator]) unless block_given?

    # else
    for i in 0..(paragraphs.length-2) do yield paragraphs[i], options[:separator] end
    yield paragraphs.last, nil
  end

  def self.title(options={})
    sentence(options).chop.gsub(/\b./){$&.upcase}
  end

protected

  def self.range_from_quantity(quantity, options={})
    return quantity if quantity.is_a?(Range)

    if options[:random]
      start = Forgery::Extend(0..options[:random_limit]).random
      start..(start+quantity-1)
    else
      0..(quantity-1)
    end
  end

  def self.lorem_ipsum_words
    @@lorem_ipsum_words ||= dictionaries[:lorem_ipsum].join(" ").downcase.gsub(/\.|,|;/, '').split(" ")
  end

  def self.lorem_ipsum_characters
    @@lorem_ipsum_characters ||= dictionaries[:lorem_ipsum].join("").downcase.gsub(/[^a-z\s]/,'')
  end

end
