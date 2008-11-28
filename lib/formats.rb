class Formats

  def initialize
    @formats = {}
  end

  def [](key)
    symbolized_key = key.to_sym
    if @formats.has_key?(symbolized_key)
      @formats[symbolized_key]
    else
      @formats[symbolized_key] = FileReader.read_format(symbolized_key)
    end
  end

  def loaded?(key)
    @formats.has_key?(key.to_sym)
  end

  def reset!
    @formats = {}
  end

end
